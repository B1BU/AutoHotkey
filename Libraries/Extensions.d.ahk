/**
 * From `Extensions.ahk`
 *
 * This variable contains the path to the Windows System32 directory.
 */
A_System32: String

/**
 * From `Extensions.ahk`
 *
 * This variable contains the path to the user's Program Files (x86) folder
 */
A_ProgramFilesx86: String

/**
 * From `Extensions.ahk`
 *
 * This variable contains the path to the user's profile folder.
 */
A_UserProfile: String

/**
 * From `Extensions.ahk`
 *
 * This variable contains the path to the root of the user's AppData folder.
 */
A_AppDataRoot: String

/**
 * From `Extensions.ahk`
 *
 * This variable contains the path to the user's AppData/Local folder.
 */
A_AppDataLocal: String

/**
 * From `Extensions.ahk`
 *
 * This variable contains the path to the user's AppData/LocalLow folder.
 */
A_AppDataLocalLow: String

/**
 * From `Extensions.ahk`
 *
 * Converts a string to Sentence Case.
 * The first letter of the first word is capitalized.
 * @param {(String)} Str
 * The string to convert.
 * @example
 * >>> StrSentence('sentence case conversion.')
 * 'Sentence case conversion.'
 */
StrSentence(Str) => String

/**
 * From `Extensions.ahk`
 *
 * Returns a new string sliced from `Start` to `Length`.
 * @param {(String)} Str
 * A string.
 * @param {(Integer)} Start
 * The start of the new string.
 * @param {(Integer)} End
 * The the of the new string.
 * @example
 * StrSlice('ABCDE', 1)
 * 'BCDE'
 * StrSlice('ABCDE', 1, -1)
 * 'BCD'
 * StrSlice('ABCDE', -2, 1)
 * 'D'
 */
StrSlice(Str, Start [, Length := '']) => String

/**
 * From `Extensions.ahk`
 *
 * Returns the value of the property if it exists in the object or a default value.
 * @param {(Object)} Obj
 * An object.
 * @param {(String)} Prop
 * The name of the property to get.
 * @param {(Any)} Default
 * The value to return if the object doesn't have the property.
 * @example
 * >>> obj := {a: 'Alpha', b: 'Beta'}
 * >>> ObjGet(obj, 'a', 'Not found')
 * 'Alpha'
 * >>> ObjGet(obj, 'c', 'Not found')
 * 'Not found'
 */
ObjGet(Obj, Prop [, Default := '']) => Any

/**
 * From `Extensions.ahk`
 *
 * Returns a new array sliced from `Start` to `Length`.
 * @param {(Array)} Arr
 * An array.
 * @param {(Integer)} Start
 * The start index of the new array.
 * @param {(Integer)} End
 * The the length of the new array.
 * @example
 * ArrSlice([1, 2, 3, 4, 5], 1)
 * [2, 3, 4, 5]
 * ArrSlice([1, 2, 3, 4, 5], 1, -1)
 * [2, 3, 4]
 * ArrSlice([1, 2, 3, 4, 5], -2, 1)
 * [4]
 */
ArrSlice(Arr, Start [, Length := '']) => Array

/**
 * From `Extensions.ahk`
 *
 * Joins a array of values using the separator.
 * @param {(Array)} Arr
 * An array to join.
 * @param {(String)} Sep
 * The separator to insert between each item.
 * @example
 * >>> ArrJoin(['A', 'B', 'C'], ', ')
 * 'A, B, C'
 */
ArrJoin(Arr [, Sep := '']) => String

/**
 * From `Extensions.ahk`
 *
 * Checks if `Value` is present in `Arr`.
 * @param {(Any)} Value
 * A value to look for.
 * @param {(Array)} Arr
 * An array to look for `Value` in.
 * @example
 * >>> InArray('B', ['A', 'B', 'C'])
 * 1
 * >>> InArray('D', ['A', 'B', 'C'])
 * 0
 */
InArray(Value, Arr) => Integer

/**
 * From `Extensions.ahk`
 *
 * Checks if `Obj` is of any of the specified types.
 * @param {(Object)} Obj
 * An object to check.
 * @param {(Class)} Types
 * One or more classes to check against `Obj`.
 * @example
 * >>> IsType('Example', Array)
 * 0
 * >>> IsType('Example', Integer, String)
 * 1
 */
IsType(Obj, Types*) => Integer

/**
 * From `Extensions.ahk`
 *
 * Calls a function a number of times and displays how long it took.
 * @param {(Func)} Function
 * The function to call.
 * @param {(Array)} Args
 * A list of arguments to pass to the function.
 * @param {(Integer)} Calls
 * The number of times to call the function.
 * @example
 * >>> Profile(SoundBeep, [500, 150], 5)
 * MsgBox('SoundBeep: 5 function calls in 797ms', '')
 */
Profile(Function [, Args := '', Calls := 1])