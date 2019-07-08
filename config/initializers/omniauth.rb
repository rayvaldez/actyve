Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '63523f71f32d7b36292a', 'a39a292dce5e7900101706147fde286945cf0d16'
end
