package
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import 	flash.display.LoaderInfo;
	import flash.text.TextField;


	public dynamic class OverlayLoaderClip extends MovieClip
	{

		// Scaleform
		public var BGSCodeObj:Object;

		// Stage
		public var Dummy_tf:TextField;



		var SWF:DisplayObject;
		var menuLoader:Loader;
		var ClipAlpha:Number = 0.65;
		var ClipScale:Number = 0.5;

		public function set clipAlpha(aValue:Number) : * { this.ClipAlpha = aValue; }
		public function set clipScale(aValue:Number) : * { this.ClipScale = aValue; }

		public function get Info() : LoaderInfo
		{
			return menuLoader.contentLoaderInfo;
		}


		// Initialize
		//---------------------------------------------

		public function OverlayLoaderClip()
		{
			super();
			BGSCodeObj = new Object();
			this.SWF = null;
			this.menuLoader = new Loader();
		}


		// Overlays
		//---------------------------------------------


		public function SWFLoad(assetName:String) : void
		{
			this.menuLoader.close();

			if(this.SWF)
			{
				this.SWFUnload(this.SWF);
			}

			var urlRequest:URLRequest = new URLRequest(assetName + ".swf");
			this.menuLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.OnLoadComplete);
			this.menuLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.OnLoadError, false, 0, true);
			this.menuLoader.load(urlRequest);
		}


		public function SWFUnload(displayObject:DisplayObject) : void
		{
			removeChild(displayObject);
			displayObject.loaderInfo.loader.unload();
		}





		// Resources
		//---------------------------------------------

		private function OnLoadError(e:IOErrorEvent) : *
		{
			trace("Failed to load .swf. " + new Error().getStackTrace());

			Dummy_tf.text = "There has been an error loading the resource.";
			Dummy_tf.appendText("\nErrorID: " + e.errorID);
			Dummy_tf.appendText("\nError: " + e.text);
			Dummy_tf.appendText("\nTarget: " + e.target);
			Dummy_tf.appendText("\nType: " + e.type);
			BGSCodeObj.notifyScripts(Dummy_tf.text);
		}


		public function OnLoadComplete(e:Event) : void
		{
			this.SWF = e.currentTarget.content;
			this.SWF.scaleX = this.ClipScale;
			this.SWF.scaleY = this.ClipScale;
			this.SWF.alpha = this.ClipAlpha;
			addChild(this.SWF);

			Dummy_tf.text = "Loaded the resource!";
			BGSCodeObj.notifyScripts(Dummy_tf.text);
		}






	}
}
