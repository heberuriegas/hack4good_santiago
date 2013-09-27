raise("Sprockets monkey patch for v 2.10.0. Check before moving on") unless Sprockets::VERSION == "2.10.0"

module Sprockets
  class Manifest
    def compile(*args)
      unless environment
        raise Error, "manifest requires environment for compilation"
      end

      paths = environment.each_logical_path(*args).to_a +
          args.flatten.select { |fn| Pathname.new(fn).absolute? if fn.is_a?(String) }

      paths.each do |path|
        if asset = find_asset(path)
          files[asset.digest_path] = {
              'logical_path' => asset.logical_path,
              'mtime' => asset.mtime.iso8601,
              'size' => asset.bytesize,
              'digest' => asset.digest
          }
          logical_path = asset.logical_path
          assets[asset.logical_path] = asset.digest_path

          target = File.join(dir, asset.digest_path)

          if File.exist?(target)
            logger.debug "Skipping #{target}, already exists"
          else
            logger.info "Writing #{target}"
            asset.write_to target
            asset.write_to "#{target}.gz" if asset.is_a?(BundledAsset)
          end

          logical_target = File.join(dir, logical_path)
          logger.info "Writing #{logical_target}"
          asset.write_to logical_target
          asset.write_to "#{logical_target}.gz" if asset.is_a?(BundledAsset)

          save
          asset
        end
      end
    end
  end
end