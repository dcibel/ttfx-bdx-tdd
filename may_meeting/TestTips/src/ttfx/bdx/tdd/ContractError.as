package ttfx.bdx.tdd
{
	public class ContractError extends Error
	{
		public function ContractError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}