flowchart TD
    A["Receive ID and owner"] --> B{"ID already exists?"}
    B -- Yes --> C["Throw exception"]
    B -- No --> D["Create BankAccount"]
    D --> E["Add it to bank"]
    E --> F["Return account"]


classDiagram
    class BankAccount {
        -int accountId
        -String accountOwner
        -double balance
        +BankAccount(int accountId, String accountOwner)
        +int accountId
        +String accountOwner
        +double balance()
        +void credit(double amount)
        +void withdraw(double amount)
    }

    class Bank {
        -String name
        -List~BankAccount~ accounts
        +Bank(String name)
        +String name
        +List~BankAccount~ accounts
        +BankAccount createAccount(int accountId, String accountOwner)
    }

    Bank "1" *-- "0..*" BankAccount : contains 




