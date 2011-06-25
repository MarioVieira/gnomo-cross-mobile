package core
{
	import org.as3.mvcsInjector.descriptors.DescriptoViews;
	import org.as3.mvcsInjector.vo.VOScreen;
	
	import uk.co.baremedia.gnomo.enums.EnumsScreens;
	import uk.co.baremedia.gnomo.enums.EnumsViewNavigation;
	
	
	import views.components.ComponentLogsDay;
	import views.components.ComponentLogsMain;
	import views.components.ComponentScreenModes;
	import views.components.ComponentUnits;
	import views.mediators.MediatorScreenLogDay;
	import views.mediators.MediatorScreenLogMain;
	import views.mediators.MediatorScreenModes;
	import views.mediators.MediatorUnits;
	
	public class CoreAppScreens
	{
		public static function getAppScreens(firstScreenName:String):DescriptoViews
		{
			var screens:Vector.<VOScreen> = new Vector.<VOScreen>;
			
			screens.push( new VOScreen(ComponentScreenModes, MediatorScreenModes, EnumsScreens.SCREEN_MODES, EnumsViewNavigation.TYPE_SCREEN) );
			screens.push( new VOScreen(ComponentUnits, MediatorUnits, EnumsScreens.SCREEN_UNITS, EnumsViewNavigation.TYPE_SCREEN) );
			screens.push( new VOScreen(ComponentLogsMain, MediatorScreenLogMain, EnumsScreens.SCREEN_LOG_MAIN, EnumsViewNavigation.TYPE_SCREEN) );
			screens.push( new VOScreen(ComponentLogsDay, MediatorScreenLogDay, EnumsScreens.SCREEN_LOG_DAY, EnumsViewNavigation.TYPE_SCREEN) );
			
			//screens.push( new VOScreen(ComponentsNoWireless, MediatorNoWireless, EnumsScreens.SCREEN_NO_WIRELESS, EnumsViewNavigation.TYPE_SCREEN) );
			//screens.push( new VOScreen(ComponentScreenConnect, MediatorScreenConnect, EnumsScreens.SCREEN_CONNECT, EnumsViewNavigation.TYPE_SCREEN) );
			//screens.push( new VOScreen(ComponentTryAgain, MediatorScreenTryAgain, EnumsScreens.SCREEN_PHONE, EnumsViewNavigation.TYPE_SCREEN) );
			//screens.push( new VOScreen(ComponentDisconnected, MediatorScreenDisconnected, EnumsScreens.SCREEN_DISCONNECTED, EnumsViewNavigation.TYPE_SCREEN) );
			//screens.push( new VOScreen(ComponentPhoneMode, MediatorScreenPhoneMode, EnumsScreens.SCREEN_PHONE_MODE, EnumsViewNavigation.TYPE_SCREEN) );
			
			return new DescriptoViews(firstScreenName, screens); 
		}
	}
}