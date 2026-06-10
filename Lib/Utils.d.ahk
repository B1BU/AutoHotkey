#Requires AutoHotkey v2.0

/**
 * From `Utils.ahk`
 *
 * This variable contains the path to the user's AutoHotkey scripts folder.
 */
A_AhkDir: String

/**
 * From `Utils.ahk`
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