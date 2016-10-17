class user_accounts (

  $accounts = {},
  $users    = {},
  $groups   = {},
  $ssh_keys = {},

) {

  class { '::accounts':
    accounts => team_filter($accounts, $users,  hiera('users::teams_filter')),
    users    => $users,
    groups   => $groups,
    ssh_keys => $ssh_keys,
  }

}
