package ttfx.bdx.tdd
{
	public class Contract
	{
		public static function precondition(test:Boolean):void {
			if (!test) {
				throw new ContractError();
			}
		}
	}
}