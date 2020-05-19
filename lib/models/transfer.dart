class Transfer {
  double value;
  String account;

  Transfer(
    this.value,
    this.account,
  );

  @override
  String toString() {
    return 'Transfer{_value: $value, _account: $account}';
  }
}
