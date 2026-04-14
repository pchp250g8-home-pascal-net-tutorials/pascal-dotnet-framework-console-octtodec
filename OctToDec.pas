uses
  System,
  System.Text.RegularExpressions;
const
  MAX_INT = Cardinal.MaxValue;
begin
  var nDecNum := 0L;
	var nOctPower := 1L;
	var nMaxOctalLen := Math.Ceiling(Math.Log(MAX_INT, 8));
	var oRegEx := new Regex('[0-7]');
	Console.WriteLine('Input an octal number');
	var strLine := Console.ReadLine();
	var nStrLen := strLine.Length;
	var nMatches := oRegEx.Matches(strLine).Count;
	var bRightString := (nStrLen <= nMaxOctalLen) and (nStrLen = nMatches);
	if not bRightString then
    begin
		Console.WriteLine('Wrong octal number format!!!');
		Console.Read();
		exit();
	end;
	for var i : integer := 1 to nStrLen do
    begin
		var nOctDight : integer := ord(strLine[nStrLen + 1 - i]) - ord('0');
		nDecNum += (nOctDight * nOctPower);
		nOctPower *= 8;
	end;
	Console.WriteLine
	(
	  'The deсimal equivalent of the octal number {0} is: {1}', 
	  strLine,
	  nDecNum
	);
	Console.Read();
end.
