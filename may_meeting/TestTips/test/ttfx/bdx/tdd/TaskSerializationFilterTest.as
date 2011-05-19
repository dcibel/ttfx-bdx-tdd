package ttfx.bdx.tdd
{
	import flexunit.framework.Assert;
	
	import mockolate.strict;
	
	import mx.collections.IList;
	import mx.logging.AbstractTarget;
	import mx.logging.ILoggingTarget;
	import mx.rpc.AbstractOperation;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.SerializationFilter;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.equalTo;
	
	public class TaskSerializationFilterTest
	{
		[Test]
		public function testDeserializeResultReturnsAnArrayOfTasks():void
		{
			var filter:TaskSerializationFilter = new TaskSerializationFilter();
			
			var result:* = filter.deserializeResult(null, "une tâche, une autre tâche");
			
			assertThat(result, isA( IList ));
			assertThat(result.length, equalTo(2) );
			assertThat(result.getItemAt(0), equalTo("une tâche"));
			assertThat(result.getItemAt(1), equalTo("une autre tâche"));
		}

	}
}