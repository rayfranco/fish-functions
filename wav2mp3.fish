function wav2mp3
  for file in *.wav
    if contains -- -f $argv; set force -y; else; set force -n; end
    set filename (basename $file .wav)
    set_color green
    echo "Converting" (set_color --bold purple)"$filename"(set_color green)".wav"(set_color normal)

    ffmpeg -loglevel panic $force -i "$file" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$filename.mp3"
  end
  echo (set_color --bold green)"Convertion complete!"(set_color --bold blue) ":)"(set_color normal)
end
