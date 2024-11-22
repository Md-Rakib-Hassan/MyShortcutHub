# **How to Use the AutoHotkey Script for Switching Between VSCode and Chrome**

This guide explains how to set up and use an **AutoHotkey script** that allows you to switch between **VSCode** and **Chrome** windows using different triggers, such as the **middle mouse button** and **Ctrl + Period (.)**.

## **Prerequisites**

- **AutoHotkey v1.x** must be installed on your system.
  - Download from [AutoHotkey](https://www.autohotkey.com/).
- Basic knowledge of **AutoHotkey** scripting to create and run scripts.

## **Setup Instructions**

###  **Create the Script File**

1. Open a text editor (e.g., Notepad).
2. Copy and paste the script into the editor or you can download the script.
3. Save the file with the extension `.ahk` (e.g., `Switch_VSode_Chrome.ahk`).

###  **Script Overview**

The script allows you to switch between open **VSCode** and **Chrome** windows with the following hotkeys:
- **Middle Mouse Button (MButton)**: Switches between **VSCode** and **Chrome** windows.
- **Ctrl + Period (.)**: Same behavior as the middle mouse button to switch between **VSCode** and **Chrome**.

You can also exclude a particular **Chrome** window (e.g., a tutorial window) from being activated by specifying its title.

###  **How the Script Works**

- **VSCode Identifier**: The script uses `"ahk_exe Code.exe"` as the identifier for **VSCode** windows. If you have a different version of VSCode or use a different executable name, modify this accordingly.
  
- **Exclude Chrome**: If you want to avoid switching to a particular **Chrome** window (e.g., a tutorial), provide its window title in the `ExcludeChrome` variable. Leave it empty (`ExcludeChrome := ""`) if you don't want to exclude any windows.

- **Middle Mouse Button and Ctrl + Period**: Press either of these shortcuts to toggle between **VSCode** and **Chrome**. The script will focus on the first available **Chrome** window (except the excluded one if specified) when **VSCode** is active, and vice versa.

###  **Script Snippets**

- **Define the VSCode and Chrome Window**  
  Set the identifier for **VSCode** and the title of the **Chrome** window you want to exclude (if any):

  ```ahk
  VSCode := "ahk_exe Code.exe"
  ExcludeChrome := ""  ; Provide the title to exclude a specific Chrome window
  ```

- **Middle Mouse Button and Ctrl + Period Hotkey**  
  Set up the hotkeys for switching between **VSCode** and **Chrome** windows:

  ```ahk
  ~MButton::
  {
      ToggleWindows()
  }
  return

  ^.::  ; Ctrl + .
  {
      ToggleWindows()
  }
  return
  ```

- **Toggle Windows Function**  
  The function that toggles between **VSCode** and **Chrome**:

  ```ahk
  ToggleWindows()
  {
      global VSCode, ExcludeChrome
      if (WinActive(VSCode))
      {
          ; Get a list of Chrome windows
          WinGet, windows, List, ahk_exe chrome.exe

          ; Loop through the list of windows
          Loop, %windows%
          {
              hwnd := windows%A_Index%
              WinGetTitle, title, ahk_id %hwnd%
              if (title != ExcludeChrome)
              {
                  WinActivate, ahk_id %hwnd%
                  return
              }
          }
      }
      else
      {
          ; Switch back to VSCode
          WinActivate, %VSCode%
      }
  }
  return
  ```

### **Running the Script**

1. **Start the Script**:
   - Double-click the saved `.ahk` file to run it. You must have **VSCode** and **Chrome** open when you start using the script for it to work effectively.
   - Ensure the script is running in the background by checking for the green **H** icon in the system tray.

2. **Use the Hotkeys**:
   - Press the **middle mouse button (MButton)** or **Ctrl + Period (.)** to toggle between **VSCode** and **Chrome** windows.

3. **Close the Script**:
   - If you no longer need the script, right-click the green **H** icon in the system tray and select **Exit**. This will stop the script from running.

4. **When to Run the Script**:
   - Run the script only when you are actively working with **VSCode** and **Chrome**, and you need to frequently toggle between them. There's no need to keep it running continuously if you’re not using it.

---

###  **Customizing the Script**

- **Exclude Chrome Window**: If you want to exclude a specific **Chrome** window (e.g., a tutorial), change the `ExcludeChrome` variable:

  ```ahk
  ExcludeChrome := "YouTube - Google Chrome"  ; Title of the Chrome window to exclude
  ```

- **Adding More Hotkeys**: If you'd like to add other key combinations, simply add more hotkeys in the same format. For example, to add **Ctrl + Alt + C**, you can write:

  ```ahk
  ^!c::  ; Ctrl + Alt + C
  {
      ToggleWindows()
  }
  ```

###  **Troubleshooting**

- If the script doesn't seem to work, ensure that **AutoHotkey v1.x** is installed properly and that the script is running in the background.
- Check that **VSCode** and **Chrome** windows are open and active when using the hotkeys.
- If the script doesn't switch as expected, ensure the window titles and executable names are correct (you can check window titles by using **AutoHotkey's Window Spy**).

---
