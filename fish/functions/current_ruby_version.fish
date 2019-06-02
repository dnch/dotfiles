function current_ruby_version
  command --search rbenv >/dev/null; and begin
    echo (rbenv version-name)
  end
end
