cask 'play-nightly' do
  version :latest
  sha256 :no_check

  # s3.us-east-2.amazonaws.com/playbuilds/ was verified as official when first introduced to the cask
  url do
    require 'open-uri'
    require 'json'
    build_url = 'https://services.purei.org/api/builds'
    hash = JSON.parse(URI(build_url).read)['commitHash']
    "https://s3.us-east-2.amazonaws.com/playbuilds/#{hash}/Play.dmg"
  end
  name 'Play! - PS2 Emulator'
  homepage 'https://purei.org/'

  app 'Play.app'
end
