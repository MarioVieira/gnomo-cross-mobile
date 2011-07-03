package views.mediators
{
	import org.as3.mvcsInjector.utils.Tracer;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.MediatorInit;
	
	import uk.co.baremedia.gnomo.presentation.PresentationScreenInfo;
	
	import views.components.ComponentInfo;
	
	public class MediatorScreenInfo extends MediatorInit
	{
		protected var _injector:IInjector;
		
		override public function init(injector:IInjector):void
		{
			super.init(injector);
			_injector 	= injector;
			_view 		= injector.getInstance(ComponentInfo);
		}
		
		public var _view	 				: ComponentInfo;
		
		override public function onRegister():void
		{ 
			Tracer.log(this, "onRegister");
			
			_view.presentationModel = new PresentationScreenInfo();
		}
		
		override public function onRemove():void
		{
			_view.presentationModel.dispose();	
		}
	}
}
