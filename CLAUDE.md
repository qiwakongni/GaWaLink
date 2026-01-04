# GaWaLink (SwiftUI) – Claude Code Project Rules (Customized)

This repository is an iOS SwiftUI project named "GaWaLink".
Claude Code MUST follow the rules below when reading, generating, or modifying code.

If any request conflicts with these rules, STOP and ask before proceeding.

============================================================
## 0. Project Snapshot (Current Structure – DO NOT BREAK)

Root:
- GaWaLink/                       (main app target sources)
- GaWaLink.xcodeproj/             (Xcode project files)
- CLAUDE.md                       (this file)

Inside `GaWaLink/` (key folders):
- Assets.xcassets/
- Components/
- Core/
  - Blockchain/
  - Network/
  - Security/
- Models/
- Utils/
- View/
  - MainTabView.swift
  - Discover/
  - Message/
  - MyPage/
  - Scan/
  - Settings/
  - Wallet/

Claude MUST preserve this structure.
Do NOT introduce a new "Features/" folder or reorganize to a different architecture.

============================================================
## 1. Tech Stack

- Platform: iOS
- Language: Swift 5.x
- UI Framework: SwiftUI
- Architecture (existing): Module folders under `GaWaLink/View/*` + ViewModels folders (where present)
- Concurrency: Prefer async/await where possible
- Storage/Security: Keychain via `GaWaLink/Core/Security/KeychainService.swift`
- Networking: `GaWaLink/Core/Network/NetworkManager.swift`
- Blockchain logic: `GaWaLink/Core/Blockchain/*`

============================================================
## 2. Non-Negotiable Folder Placement Rules

### 2.1 UI / SwiftUI Views
All screen UI code MUST live under:
- `GaWaLink/View/**`

Examples (existing):
- `GaWaLink/View/MainTabView.swift`
- `GaWaLink/View/Message/MessageView.swift`
- `GaWaLink/View/MyPage/MyView.swift`
- `GaWaLink/View/Settings/SettingsView.swift`
- `GaWaLink/View/Scan/ScanView.swift`
- `GaWaLink/View/Discover/**`
- `GaWaLink/View/Wallet/**`

FORBIDDEN:
- Creating UI screen files under `Core/`, `Models/`, `Utils/`
- Creating a new top-level folder like `Features/` or `Screens/`

### 2.2 Reusable SwiftUI Components
Reusable shared UI components MUST live under:
- `GaWaLink/Components/`

Example:
- `GaWaLink/Components/PrimaryButton.swift`

### 2.3 Core Logic (Non-UI)
All non-UI reusable logic MUST live under:
- `GaWaLink/Core/**`

Subfolders are fixed:
- Blockchain: `GaWaLink/Core/Blockchain/`
- Network: `GaWaLink/Core/Network/`
- Security: `GaWaLink/Core/Security/`

FORBIDDEN:
- Putting screen-specific logic in Core
- Importing SwiftUI in Core files (Core should be UI-agnostic)

### 2.4 Models
Shared app models MUST live under:
- `GaWaLink/Models/`

Existing models:
- Token.swift, Transaction.swift, Wallet.swift

Feature/module-specific models:
- If a module already has its own `Models/` folder (e.g. `View/Discover/Models/`), keep that model scoped there.
- Do NOT move models between shared `GaWaLink/Models/` and module `View/*/Models/` unless explicitly asked.

### 2.5 Utilities
General utility helpers MUST live under:
- `GaWaLink/Utils/` (e.g. Logger.swift)

============================================================
## 3. Module Rules Under `GaWaLink/View/`

GaWaLink organizes screens by modules under `GaWaLink/View/`.

### 3.1 Allowed pattern for each module
For a module (example: Discover):
- `GaWaLink/View/Discover/Views/`        (SwiftUI views)
- `GaWaLink/View/Discover/ViewModels/`   (ViewModels)
- `GaWaLink/View/Discover/Models/`       (optional module-only models)

Claude MUST follow existing module conventions:
- If module already has `Views/` and `ViewModels/`, place new files accordingly.
- If module currently stores views directly in the module root (e.g. MessageView.swift), keep following that module’s current style.
- Do NOT “normalize” modules to a new pattern unless asked.

### 3.2 Wallet module
Wallet currently contains mixed folders:
- `GaWaLink/View/Wallet/Model/`
- `GaWaLink/View/Wallet/View/`
- `GaWaLink/View/Wallet/ViewModel/`
- `GaWaLink/View/Wallet/WalletViewModel.swift`
- plus submodules like `Send/`

Rules:
- Add Wallet-related UI under `GaWaLink/View/Wallet/View/` if it exists and is used.
- Add Wallet ViewModels under `GaWaLink/View/Wallet/ViewModel/` if it exists and is used.
- Do NOT move `WalletViewModel.swift` unless explicitly asked.
- If creating new Wallet view models, prefer placing them in `ViewModel/` and keep naming consistent.

### 3.3 Scan module (note current naming inconsistency)
Scan currently contains:
- `GaWaLink/View/Scan/ScanView.swift`
- `GaWaLink/View/Scan/VidewModel/`   (typo)
- `GaWaLink/View/Scan/View/`

Rules:
- Do NOT rename folders automatically.
- When adding Scan ViewModels:
  - Prefer using the existing `VidewModel/` folder (even if misspelled) to match current project references.
  - If you must create a new file and you are unsure where it’s referenced from, STOP and ask.

============================================================
## 4. SwiftUI View Rules (STRICT)

Views should be thin and declarative.

Views MUST:
- Render UI
- Bind state
- Forward actions to ViewModel / Services via ViewModel

Views MUST NOT:
- Perform networking directly
- Access Keychain/UserDefaults directly
- Contain business logic (signing transactions, request building, etc.)

State rules:
- Prefer `@StateObject` for owned ViewModels
- Prefer initializer injection: `init(vm: ...)`
- Avoid creating ViewModels in `body`

============================================================
## 5. ViewModel Rules

ViewModels SHOULD:
- Be `final`
- Use `@MainActor` when they publish UI state
- Conform to `ObservableObject`
- Expose UI state with `@Published`

Dependencies:
- Prefer dependency injection via init parameters.
- If existing code uses direct service instantiation, keep consistent and do not refactor broadly unless asked.

ViewModels MUST NOT:
- Contain SwiftUI view code
- Do Keychain or Network calls directly if there is an existing Core service that already does it

============================================================
## 6. Core Services Usage Rules

### 6.1 Blockchain
All blockchain-related operations MUST use or extend:
- `GaWaLink/Core/Blockchain/*`
Examples: WalletService, BalanceService, ERC20Service, TransactionService

Do NOT re-implement blockchain logic inside Views/ViewModels if a service exists.

### 6.2 Network
Networking MUST use:
- `GaWaLink/Core/Network/NetworkManager.swift`
Do NOT introduce a second networking layer unless requested.

### 6.3 Security
Secure storage MUST use:
- `GaWaLink/Core/Security/KeychainService.swift`
Do NOT store secrets in UserDefaults.

============================================================
## 7. Naming Conventions (Keep Existing)

- Preserve existing folder names and spelling as-is.
- Preserve existing file naming patterns inside each module.
- Do NOT mass-rename or “clean up” naming inconsistencies unless explicitly asked.

Preferred Swift types naming:
- Views: `XxxView`
- ViewModels: `XxxViewModel`

============================================================
## 8. Safety Rules – What Claude Must NOT Do

Claude MUST NOT:
- Modify Xcode project settings or `.pbxproj`
- Change entitlements unless explicitly asked (`GaWaLink/GaWaLink.entitlements`)
- Introduce new dependency managers or add third-party libraries unless asked
- Restructure the folder hierarchy
- Rename folders like `VidewModel` to `ViewModel` automatically

============================================================
## 9. Testing (Optional / On Request)

There is currently no explicit Tests folder shown in the snapshot.
Rules:
- If user asks for tests, create them using XCTest.
- Place tests under a `Tests/` group/folder only if the Xcode project already has a test target.
- Do NOT create a new test target automatically.

============================================================
## 10. Work Style (How Claude Should Operate)

When implementing a feature or change:
1) Identify the correct module folder under `GaWaLink/View/...`
2) Add/modify minimal files required
3) Do not refactor unrelated code
4) Summarize changes by file path

If something is ambiguous (e.g., Scan ViewModel folder usage), STOP and ask.

============================================================
End of GaWaLink rules.
