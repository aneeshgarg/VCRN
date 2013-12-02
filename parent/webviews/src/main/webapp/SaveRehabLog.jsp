	<%@ page import="com.pioneers.vcrn.data.RehabLog" %>
	<%@ page import="com.pioneers.vcrn.data.Diet" %>
	<%@ page import="java.util.*" %>
	<jsp:useBean id="newLog" scope="request" class="com.pioneers.vcrn.data.RehabLog" />
	<jsp:setProperty name="newLog" property="*"/>
     <% RequestDispatcher rd = getServletContext().getRequestDispatcher("/rehablog");
     Map<String,String[]> parMap= (Map<String,String[]>)request.getParameterMap();
     String caloriesKey = "calories";
     String sodiumKey= "sodium";
     String cholestrolKey="cholestrol";
     String foodNameKey="foodName";
     String fatKey = "fat";
     Set<String> keySet = parMap.keySet();
     System.out.println(keySet);
     int dietRowCount=0;
     for(String s:keySet){
    	 if(s.startsWith(foodNameKey)){
    		 dietRowCount++;
    	 }
     }     
     List<Diet> dietList = new ArrayList<Diet>();
     for(int i=0;i<dietRowCount;i++){
    	 Diet diet = new Diet();
    	 System.out.println("Diet name "+parMap.get(foodNameKey+(i+1))[0]);
    	 diet.setFoodName(parMap.get(foodNameKey+(i+1))[0]);
    	 diet.setCalories(Double.parseDouble(parMap.get(caloriesKey+(i+1))[0]));
    	 diet.setSodium(Double.parseDouble(parMap.get(sodiumKey+(i+1))[0]));
    	 diet.setCholestrol(Double.parseDouble(parMap.get(cholestrolKey+(i+1))[0]));
    	 diet.setFat(Double.parseDouble(parMap.get(fatKey+(i+1))[0]));
    	 dietList.add(diet);
     }
     newLog.setDietList(dietList);
     System.out.println("Rehab log is "+newLog);
     rd.forward(request, response);
     %>