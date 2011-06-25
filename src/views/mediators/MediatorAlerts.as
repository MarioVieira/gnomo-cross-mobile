package views.mediators
{
	import com.projectcocoon.p2p.util.Tracer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import spark.components.TabbedViewNavigatorApplication;
	
	import uk.co.baremedia.gnomo.controls.ControlPersistedData;
	import uk.co.baremedia.gnomo.presentation.PresentationShell;
	
	import views.components.ComponentAlerts;
	
	public class MediatorAlerts extends MediatorInit
	{
		protected var _view	 				: ComponentAlerts;
		protected var _injector				: IInjector;
		
		public function MediatorAlerts() 
		{
			Tracer.log(this);
		}
		
		override public function init(injector:IInjector):void
		{
			Tracer.log(this, "init");
			
			super.init(injector);
			_view 		= injector.getInstance(ComponentAlerts);
			_injector 	= injector;
		}
		
		override public function onRegister():void
		{ 
			_view.presentationModel  = new PresentationShell( _injector.getInstance(ControlPersistedData) as ControlPersistedData );
		}
		
		override public function onRemove():void
		{
			_view.presentationModel.dispose();
		}
	}
}