//Q1 implement decide attributes for the bank account class
//final mean this value only can asign once and cannot be changed after that
//Q2 implement the methods for the bank account class
//Q3: choose a attributes
class BankAccount {
    // TODO
    final int _accountId;
    final String _accountOwner;
    double _balance; 

    BankAccount({
      required int accountId,
      required String accountOwner,
    }
     ) : 
       _balance = 0.0,
       _accountId = accountId,
       _accountOwner = accountOwner;
       //This is a parameterized constructor because it accepts an ID and owner.
      

       //Getter
       //Private attributes need getters
       int get accountId => _accountId;
       String get accountOwner => _accountOwner;
       double get balance => _balance;
       
       double Balance() {
        return _balance;
       }

       void withdraw(double amount) {
        if (amount <= 0) {
            throw Exception('Withdrawal amount must be positive!');
        }
        if (amount > _balance) {
            throw Exception('Insufficient balance for withdrawal!');
        }
        _balance -= amount;
       }

}
//Q3: choose the attributes for the bank class
//Q4: implement for the bank class 
class Bank {
    // TODO
    final String _name;
    final List<BankAccount> _accounts = [];
    
    // return unmodifiable view of the account
    List<BankAccount> get accounts => List.unmodifiable(_accounts);
    //construtor
    Bank({required String name}) : _name = name;
    String get name = > _name; 

    BankAccount createAccount({
      
      required int accountId,
      required String accountOwner,
    
    })  {
      final alreadyExist_account = _accounts.any((account)=> account.accountId == accountId);
      if(alreadyExist_account) {
      throw StateError("'Account ID already exists.'");
    }
     final account = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner
     )
    }   
    _accounts.add(account);
}
 
void main() {

  // Bank myBank = Bank(name: "CADT Bank");
  // BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  // print(ronanAccount.balance); // Balance: $0
  // ronanAccount.credit(100);
  // print(ronanAccount.balance); // Balance: $100
  // ronanAccount.withdraw(50);
  // print(ronanAccount.balance); // Balance: $50

  // try {
  //   ronanAccount.withdraw(75); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Insufficient balance for withdrawal!
  // }

  // try {
  //   myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Account with ID 100 already exists!
  // }
}
