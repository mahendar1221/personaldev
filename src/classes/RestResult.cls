global class RestResult
{
    public String status;
    public Integer responseCode;
    public String message;   
    public Object leadInfo; 
    public List<sObject> lstReturnSObject;    
    global RestResult(String statusVar ,String messageVar)  {
        //RestConstant restConstant = new RestConstant();
        //Map<String, Object> mapConstantClass = (Map<String,Object>)JSON.deserializeUntyped(JSON.serialize(restConstant));
        //this.status = (String)mapConstantClass.get(statusVar);
        //this.message = (String)mapConstantClass.get(messageVar);
        //this.responseCode = restConstant.responseCodeMap.get(messageVar);
    }    
    global void setRestResponse(RestResponse res)  {
        String jsonString = JSON.serialize(this);
        res.responseBody = Blob.valueOf(jsonString);
        res.statusCode = responseCode;
    }
        
}