class user_accounts (

  $accounts = {},
  $users    = {},
  $groups   = {},
  $ssh_keys = {},

) {

  $teams_filter = hiera('users::teams_filter', [])

  if size($teams_filter) > 0 {
    $_accounts = team_filter($accounts, $users,  $teams_filter)
  } else {
    $_accounts = $accounts
  }

  class { '::accounts':
    accounts => hash_filter($_accounts, 'ensure', ['absent', 'present']),
    users    => $users,
    groups   => $groups,
    ssh_keys => $ssh_keys,
  }

}
