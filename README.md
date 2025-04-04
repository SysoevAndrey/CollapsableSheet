# CollapsableSheet

A SwiftUI modifier that mimics the collapsible sheet behavior found in Apple's Mail app on iOS. This implementation was originally inspired by a solution found on [Reddit](https://www.reddit.com/r/SwiftUI/comments/1cij5y5/sticky_bottom_sheet_like_mail_code_in_comments/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button), but has been adapted to closely resemble Apple's native behavior.

## Features

-   Smooth collapsing and expanding animation
-   Works seamlessly with SwiftUI views
-   Customizable behavior

## Demo

<img style="border-radius: 16px; border: 1px solid #000;" src="https://github.com/user-attachments/assets/961a76f3-2403-433c-b161-27da2139ad4a" alt="example" height="400" />
<img style="border-radius: 16px; border: 1px solid #000;" src="https://github.com/user-attachments/assets/ab5d1b5f-7f0a-4ad6-8f47-41275dd06694" alt="example" height="400" />
<img style="border-radius: 16px; border: 1px solid #000;" src="https://github.com/user-attachments/assets/e55e981d-9d7a-475e-92bb-5454043a4f0d" alt="example" height="400" />

## Usage

Apply the `.collapsableSheet()` modifier:

```swift
struct ContentView: View {
    @State private var isSheetPresented = false

    var body: some View {
        Button("Show Sheet") {
            isSheetPresented = true
        }
        .collapsableSheet(isPresented: $isSheetPresented) {
            TaskFormView(isSheetPresented: $isSheetPresented)
        } preview: {
            PreviewView()
        }
    }
}
```

## License

This project is available under the MIT license. Feel free to use and modify it as needed.
