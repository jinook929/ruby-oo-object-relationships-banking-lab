class BankAccount
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :balance, :status
    attr_reader :name
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        self.class.all.push(self)
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0
    end

    def close_account
        self.status = "closed"
        self.class.all.delete_if {|account| account == self}
    end
end