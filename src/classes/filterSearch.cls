public class filterSearch {

    public integer output { get; set; }

    public PageReference Calculate() {
    output = EndDate.daysBetween(startDate);
    system.debug(output );
    
        return null;
    }


    public date EndDate { get; set; }

    public date startDate { get; set; }
}