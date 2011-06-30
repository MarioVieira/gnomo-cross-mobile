package uk.co.baremedia.gnomo.mobile.core
{
	import org.as3.mvcsInjector.interfaces.IMappingMediator;
	import org.robotlegs.core.IMediatorMap;
	
	import views.components.ComponentAlerts;
	import views.components.ComponentLogs;
	import views.components.ComponentInfo;
	import views.components.ComponentUnits;
	import views.mediators.MediatorAlerts;
	import views.mediators.MediatorScreenLogs;
	import views.mediators.MediatorScreenModes;
	import views.mediators.MediatorUnits;
	
	
	public class MapViews implements IMappingMediator
	{
		public function mapMediators(mediatorMap:IMediatorMap):void
		{
			mediatorMap.mapView(ComponentUnits, MediatorUnits);
			mediatorMap.mapView(ComponentLogs, MediatorScreenLogs);
			mediatorMap.mapView(ComponentInfo, MediatorScreenModes);
		}
	}
}