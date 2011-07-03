package core
{
	import org.as3.mvcsInjector.descriptors.DescriptoViews;
	import org.as3.mvcsInjector.vo.VOScreen;
	
	import uk.co.baremedia.gnomo.enums.EnumsScreens;
	import uk.co.baremedia.gnomo.enums.EnumsViewNavigation;
	
	import views.components.ComponentInfo;
	import views.components.ComponentLogs;
	import views.components.ComponentUnits;
	import views.mediators.MediatorScreenLogs;
	import views.mediators.MediatorScreenInfo;
	import views.mediators.MediatorUnits;
	
	public class CoreAppScreens
	{
		public static function getAppScreens(firstScreenName:String):DescriptoViews
		{
			var screens:Vector.<VOScreen> = new Vector.<VOScreen>;
			
			screens.push( new VOScreen(ComponentUnits, MediatorUnits, EnumsScreens.SCREEN_UNITS, EnumsViewNavigation.TYPE_SCREEN) );
			screens.push( new VOScreen(ComponentLogs, MediatorScreenLogs, EnumsScreens.SCREEN_LOG_DAY, EnumsViewNavigation.TYPE_SCREEN) );
			screens.push( new VOScreen(ComponentInfo, MediatorScreenInfo, EnumsScreens.SCREEN_MODES, EnumsViewNavigation.TYPE_SCREEN) );
			
			return new DescriptoViews(firstScreenName, screens); 
		}
	}
}