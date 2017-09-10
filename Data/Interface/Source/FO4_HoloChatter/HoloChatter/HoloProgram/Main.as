package
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.text.TextField;

	public class Main extends MovieClip
	{

		// Scaleform
		public var BGSCodeObj:Object;

		// Interoperation
		private const DataToken:String = "DataToken";
		private var DataValue:String;

		// Resources
		public var OverlayLoader_mc:OverlayLoaderClip;

		// Stage
		public var Message_tf:TextField;





		// Initialize
		//---------------------------------------------

		public function Main()
		{
			super();
			BGSCodeObj = new Object();
		}


		public function InitProgram() : *
		{
			DataValue = BGSCodeObj.getTextReplaceValue(DataToken);


			OverlayLoader_mc.clipScale = 1.0;
			OverlayLoader_mc.clipAlpha = 1;
			OverlayLoader_mc.SWFLoad("Overlays/GasMask_Lens");
			//OverlayLoader_mc.SWFLoad(DataValue);




			// HUDMenu is the menu document class

			Message_tf.text = String(MovieClip(root));
		}









	}
}
