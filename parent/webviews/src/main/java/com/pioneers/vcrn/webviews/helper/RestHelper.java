package com.pioneers.vcrn.webviews.helper;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

public class RestHelper {

    public static String       BASE_ADDRESS = "http://localhost:8080/webservices/restful";
    public static String       SERVERURL;

    public static final String METHOD_GET   = "GET";
    public static final String METHOD_POST  = "POST";
    static String              date;
    static SimpleDateFormat    format;

    HttpURLConnection          conn         = null;

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public Object callRestService(String serviceUri, String requestType, Object data, Class responseClass)
            throws Exception {
        try {

            SERVERURL = BASE_ADDRESS;

            URL url = new URL(SERVERURL + serviceUri);

            conn = (HttpURLConnection) url.openConnection();

            if (requestType.equals(METHOD_POST)) {
                conn.setDoOutput(true);
            }
            conn.setRequestMethod(requestType);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setConnectTimeout(ApiConstants.REQUEST_TIMEOUT_MILLIS);
            conn.setReadTimeout(ApiConstants.REQUEST_TIMEOUT_MILLIS);
            conn.setUseCaches(false);

            if (data != null) {
                Gson gson = new GsonBuilder().setDateFormat(DateFormats.YYYY_MM_DD).create();

                String requestJson = gson.toJson(data);
                System.out.println(requestJson);

                OutputStream os = conn.getOutputStream();
                os.write(requestJson.getBytes());
                os.flush();
            }
            long startTimeServiceCall = System.currentTimeMillis();
            InputStream responseJson = conn.getInputStream();
            long endTimeServiceCall = System.currentTimeMillis();

            System.out.println("Time for getting response from service=" + (endTimeServiceCall - startTimeServiceCall));

            if (responseJson != null)
                return new Gson().fromJson(new InputStreamReader(responseJson, "UTF-8"), responseClass);
        } catch (Exception e) {

            System.out.println("RESPONSE STATUS CODE = " + conn.getResponseCode());
            System.out.println("exception=" + e.toString());

            throw new Exception(conn.getResponseCode() + "");
        } finally {

        }
        return null;
    }

    public static void dumpObject(Object o) {
        String s;
        try {
            s = new Gson().toJson(o);
        } catch (Exception e) {
            s = "Exception " + e + " dumping " + o;
        }
        dumpString(s);
    }

    public static void dumpString(String s) {
        System.out.println(s);
    }

    public static Gson getJsonParser() {
        GsonBuilder gsonb = new GsonBuilder();
        DateDeserializer ds = new RestHelper.DateDeserializer();
        gsonb.registerTypeAdapter(Date.class, ds);
        Gson gson = gsonb.create();
        return gson;
    }

    public static class DateDeserializer implements JsonDeserializer<Date> {
        public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            format = new SimpleDateFormat("yyyy-MM-dd");
            date = json.getAsJsonPrimitive().getAsString();

            try {
                return format.parse(date);
            } catch (ParseException e) {
                try {
                    SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MMM-yy");
                    Date inputDate = inputFormat.parse(date);
                    String outputDateString = format.format(inputDate);
                    return format.parse(outputDateString);

                } catch (ParseException e2) {
                    date = usingDateFormatter(Long.parseLong(date));
                    try {
                        return format.parse(date);
                    } catch (ParseException e1) {
                        e1.printStackTrace(System.err);
                    }
                    e2.printStackTrace(System.err);
                }

                throw new RuntimeException(e);
            }
        }

        private String usingDateFormatter(long input) {
            Date date = new Date(input);
            Calendar cal = new GregorianCalendar();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setCalendar(cal);
            cal.setTime(date);

            return sdf.format(date);
        }
    }
}