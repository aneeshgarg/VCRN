	<%@ page import="com.pioneers.vcrn.data.RehabPlan" %>
	<%@ page import="com.pioneers.vcrn.data.Exercise" %>
	<%@ page import="com.pioneers.vcrn.data.Medication" %>
	<%@ page import="java.util.*" %>
	<jsp:useBean id="newPlan" scope="request" class="com.pioneers.vcrn.data.RehabPlan" />
	<jsp:setProperty name="newPlan" property="*"/>
     <% RequestDispatcher rd = getServletContext().getRequestDispatcher("/rehabplan");
     Map<String,String[]> parMap= (Map<String,String[]>)request.getParameterMap();
     String excerciseKey = "excerciseName";
     String timeKey= "timeToSpend";
     String weightKey="weight";
     String repKey="repetitions";
     String medicineKey = "medicineName";
     String tttKey="timeToTake";
     String dosageKey="dosage";
     String typeKey="type";
     Set<String> keySet = parMap.keySet();
     System.out.println(keySet);
     int execRowCount=0;
     int medRowCount=0;
     for(String s:keySet){
    	 if(s.startsWith(excerciseKey)){
    		 execRowCount++;
    	 }
    	 if(s.startsWith(medicineKey)){
    		 medRowCount++;
    	 }
     }     
     List<Exercise> excerList = new ArrayList<Exercise>();
     for(int i=0;i<execRowCount;i++){
    	 Exercise exer = new Exercise();
    	 exer.setExerciseName(parMap.get(excerciseKey+(i+1))[0]);
    	 exer.setTimeToSpend(parMap.get(timeKey+(i+1))[0]);
    	 exer.setWeight(Double.parseDouble(parMap.get(weightKey+(i+1))[0]));
    	 exer.setRepetitions(parMap.get(repKey+(i+1))[0]);
    	 excerList.add(exer);
     }
     List<Medication> medicList = new ArrayList<Medication>();
     for(int i=0;i<medRowCount;i++){
    	 Medication medic = new Medication();
    	 medic.setTimeToTake(parMap.get(tttKey+(i+1))[0]);
    	 medic.setMedicineName(parMap.get(medicineKey+(i+1))[0]);
    	 medic.setDosage(parMap.get(dosageKey+(i+1))[0]);
    	 medic.setType(parMap.get(typeKey+(i+1))[0]);
    	 medicList.add(medic);
     }     
     newPlan.setExerciseList(excerList);
     newPlan.setMedicationList(medicList);
     request.setAttribute("action", "updatePlan");
     	rd.forward(request, response);
     %>