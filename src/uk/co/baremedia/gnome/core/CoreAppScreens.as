package uk.co.baremedia.gnome.core
{
	import org.as3.mvcsInjector.descriptors.DescriptoViews;
	import org.as3.mvcsInjector.vo.VOScreen;
	
	import uk.co.baremedia.gnome.views.components.ComponentInfo;
	import uk.co.baremedia.gnome.views.components.ComponentLogs;
	import uk.co.baremedia.gnome.views.components.ComponentUnits;
	import uk.co.baremedia.gnome.views.mediators.MediatorScreenInfo;
	import uk.co.baremedia.gnome.views.mediators.MediatorScreenLogs;
	import uk.co.baremedia.gnome.views.mediators.MediatorUnits;
	import uk.co.baremedia.gnomo.enums.EnumsScreens;
	import uk.co.baremedia.gnomo.enums.EnumsViewNavigation;
	
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