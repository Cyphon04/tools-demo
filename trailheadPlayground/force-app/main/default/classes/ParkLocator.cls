public class ParkLocator {
    public static List<String> country(String Country)
    {
        	ParkService.ParksImplPort  prkSvc = new ParkService.ParksImplPort();
            return prkSvc.byCountry(country);
    }
}