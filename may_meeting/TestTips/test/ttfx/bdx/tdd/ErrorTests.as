package ttfx.bdx.tdd
{
	public class ErrorTests {		
		
		private var error:ContractError; // make sur it gets compiled (for test before implementation)
		
		[Test(expects="ttfx.bdx.tdd.ContractError")]
		public function testPreconditionThrowsErrorWhenNoMet():void {
			Contract.precondition(false);
		}
		
		[Test]
		public function testPreconditionIsSilentWhenMet():void {
			Contract.precondition(true);
			// no error should be thrown
		}
	}
}