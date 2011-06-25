package uk.co.baremedia.gnomo.mobile.core
{
	import org.as3.mvcsInjector.interfaces.IMappingMediator;
	import org.robotlegs.core.IMediatorMap;
	
	import views.components.ComponentAlerts;
	import views.components.ComponentScreenModes;
	import views.components.ComponentUnits;
	import views.mediators.MediatorAlerts;
	import views.mediators.MediatorScreenModes;
	import views.mediators.MediatorUnits;
	
	
	public class MapViews implements IMappingMediator
	{
		public function mapMediators(mediatorMap:IMediatorMap):void
		{
			mediatorMap.mapView(ComponentAlerts, MediatorAlerts);
			mediatorMap.mapView(ComponentUnits, MediatorUnits);
			mediatorMap.mapView(ComponentScreenModes, MediatorScreenModes);
		}
	}
}