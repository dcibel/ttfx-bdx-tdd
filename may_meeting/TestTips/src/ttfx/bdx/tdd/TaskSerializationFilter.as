package ttfx.bdx.tdd
{
	import mx.collections.ArrayCollection;
	import mx.rpc.http.AbstractOperation;
	import mx.rpc.http.SerializationFilter;
	import mx.utils.StringUtil;
	
	public class TaskSerializationFilter extends SerializationFilter
	{
		override public function deserializeResult(operation:AbstractOperation, result:Object):Object {
			var tasks:Array = StringUtil.trimArrayElements(String(result), ",").split(",");
			trace(tasks);
			return new ArrayCollection(tasks);
		}
	}
}