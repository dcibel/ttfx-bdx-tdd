package ttfx.bdx.tdd
{
	import flex.lang.reflect.Method;

	public class CollectionUtil
	{
		public static function callOnEach(array:Array, methodName:String):void {
			for each(var obj:Object in array) {
				var method:Function = obj[methodName];
				
				method.apply(obj,null);
			}
		}
	}
}