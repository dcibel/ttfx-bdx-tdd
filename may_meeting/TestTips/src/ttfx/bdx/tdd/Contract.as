package ttfx.bdx.tdd
{
	public class Contract
	{
		public static function precondition(test:Boolean):void {
			if (!test) {
				throw new ContractError();
			}
		}
		
		public static function postcondition(test:Boolean):void {
			if (!test) {
				throw new ContractError();
			}
		}
	}
}