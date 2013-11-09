package  
{
	
	import br.com.stimuli.loading.BulkLoader;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author umhr
	 */
	public class Canvas extends Sprite 
	{
		private var _bulkLoader:BulkLoader;
		
		public function Canvas() 
		{
			init();
		}
		private function init():void 
		{
			if (stage) onInit();
			else addEventListener(Event.ADDED_TO_STAGE, onInit);
		}

		private function onInit(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onInit);
			// entry point
			
			_bulkLoader = new BulkLoader("theOne");
			_bulkLoader.add("images/img1.jpg", { type:BulkLoader.TYPE_IMAGE, id:"img1" } );
			_bulkLoader.add("images/img2.jpg", { type:BulkLoader.TYPE_IMAGE, id:"img2" } );
			_bulkLoader.add("images/img3.jpg", { type:BulkLoader.TYPE_IMAGE, id:"img3" } );
			_bulkLoader.add("images/img4.jpg", { type:BulkLoader.TYPE_IMAGE, id:"img4" } );
			_bulkLoader.addEventListener(BulkLoader.COMPLETE, bulkLoader_complete);
			_bulkLoader.start();
			
		}
		
		private function bulkLoader_complete(e:Event):void 
		{
			var imgW:int = _bulkLoader.getBitmapData("img1").width;
			var imgH:int = _bulkLoader.getBitmapData("img1").height;
			
			var w:int = Math.ceil(stage.stageWidth/imgW);
			var h:int = Math.ceil(stage.stageHeight/imgH);
			for (var i:int = 0; i < w; i++) 
			{
				for (var j:int = 0; j < h; j++) 
				{
					var photoSlider:PhotoSlider = new PhotoSlider();
					photoSlider.addBitmapData(_bulkLoader.getBitmapData("img1"));
					photoSlider.addBitmapData(_bulkLoader.getBitmapData("img2"));
					photoSlider.addBitmapData(_bulkLoader.getBitmapData("img3"));
					photoSlider.addBitmapData(_bulkLoader.getBitmapData("img4"));
					addChild(photoSlider);
					photoSlider.x = i * imgW;
					photoSlider.y = j * imgH;
					photoSlider.start();
				}
			}
		}
	}
	
}