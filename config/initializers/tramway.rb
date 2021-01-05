Tramway::Core.initialize_application name: :indahouse_nas

Tramway::Admin.set_available_models(
  Tramway::User::User,
  Photo,
  project: :indahouse_nas
)

Tramway::Admin.navbar_structure(
  Photo,
  Tramway::User::User,
  project: :indahouse_nas
)
