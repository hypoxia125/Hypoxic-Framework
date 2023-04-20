/*--------------------------------------------------------------------------------------------------
	Get Time Date Ahead

	Usage: Converts date to a number, adds number of minutes to that number, then outputs the number
	for use in comparisons based on in-game date/time.

	Parameters:
		0.) Minutes - Number

	Example:
		[60] call HYP_fnc_getTimeDateAhead
--------------------------------------------------------------------------------------------------*/

params [["_min", 0, [-1]]];

private _dateNumber = dateToNumber date;
private _year = date select 0;

private _isLeapYear = (
	_year % 400 == 0 or
	(_year % 4 == 0 && _year % 100 != 0)
);

private _daysInYear = [365,366] select _isLeapYear;

// conversion from min to unit number (365 days = 1.0, 366 = 1.00274)
private _delta = _min / 60 / 24 / _daysInYear;

private _dateNumber = _dateNumber + _delta;
if (_dateNumber > 1) exitWith { false };

// return
_dateNumber;