package ttfx.bdx.tdd
{
	import org.flexunit.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.core.throws;

	public class ErrorTests {		
		
		private var error:ContractError; // make sur it gets compiled (for test before implementation)
		
		[Test(expects="ttfx.bdx.tdd.ContractError")]
		public function testPreconditionThrowsErrorWhenNotMet():void {
			Contract.precondition(false);
		}
		
		[Test]
		public function testPreconditionIsSilentWhenMet():void {
			Contract.precondition(true);
			// no error should be thrown
		}
		
		[Test]
		public function testPostconditionThrowsErrorWhenNotMet():void {
			var call:Function = function():void {
				Contract.postcondition(false);
			};
			
			assertThat(call, throws(ContractError));
		}
		
		[Test]
		public function testPostconditionIsSilentWhenMet():void {
			var call:Function = function():void {
				Contract.postcondition(true);
			};
			
			assertThat(call, not(throws(ContractError)) );
		}
	}
}