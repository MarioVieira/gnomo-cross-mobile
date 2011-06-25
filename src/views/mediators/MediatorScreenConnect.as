package uk.co.baremedia.gnomo.mobile.view.mediators
{
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import uk.co.baremedia.gnomo.controls.ControlUnits;
	import uk.co.baremedia.gnomo.presentation.PresentationScreenConnect;
	
	import views.components.ComponentScreenConnect;
	
	public class MediatorScreenConnect extends MediatorInit
	{
		override public function init(injector:IInjector):void
		{
			super.init(injector);
			_view 		= injector.getInstance(ComponentScreenConnect);
			_injector 	= injector;
		}
		
		public var _view	 				: ComponentScreenConnect;
		private var _injector				: IInjector;
		
		override public function onRegister():void
		{ 
			_view.presentationModel = new PresentationScreenConnect( _injector.getInstance(ControlUnits) );
		}
		
		override public function onRemove():void
		{
			_view.presentationModel.dispose();	
		}
	}
}