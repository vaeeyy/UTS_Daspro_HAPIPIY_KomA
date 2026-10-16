Program Tixora;
uses crt;
var 
  pilihan, i, pilihKonser, jumlah: integer;
  namaKonser: array[1..3] of string;
  hargaKonser: array[1..3] of longint;
  subtotal, diskon, total: longint;
  totalTerakhir: longint;
  namaTerakhir: string;
  adaPesanan, batal: boolean;
begin 
  { Data Konser }
  namaKonser[1] := 'LANY';
  namaKonser[2] := 'Tulus';
  namaKonser[3] := 'Bernadya';

  { Harga Simulasi Tiket }
  hargaKonser[1] := 1500000;
  hargaKonser[2] := 500000;
  hargaKonser[3] := 250000;

  adaPesanan := false;
  totalTerakhir := 0;
  namaTerakhir := '';

  repeat 
    clrscr;
    writeln('=================================');
    writeln('             TIXORA              ');
    writeln('     PEMESANAN TIKET KONSER      ');
    writeln('=================================');
    writeln('1. Lihat Daftar Konser');
    writeln('2. Pesan Tiket');
    writeln('3. Lihat Pesanan Terakhir');
    writeln('4. Keluar');
    writeln('=================================');
    write('Pilih Menu (1-4): ');
    readln(pilihan);

    case pilihan of
      1: begin 
           writeln;
           writeln('DAFTAR KONSER');
           for i := 1 to Length(namaKonser) do 
             writeln(i, '. ', namaKonser[i], ' - Rp', hargaKonser[i]);
           writeln;
           write('Tekan Enter untuk kembali...');
           readln;
         end;

      2: begin
           writeln;
           writeln('DAFTAR KONSER');
           for i := 1 to 3 do 
             writeln(i, '. ', namaKonser[i], ' - Rp', hargaKonser[i]);
           writeln('0. Batal');
           write('Pilih konser (0-3): ');
           readln(pilihKonser);

           while (pilihKonser < 0) or (pilihKonser > 3) do 
           begin 
             writeln('Pilihan tidak valid!');
             write('Pilih konser (0-3): ');
             readln(pilihKonser);
           end;

           batal := (pilihKonser = 0);

           if not batal then 
           begin 
             write('Jumlah tiket (0 untuk batal): ');
             readln(jumlah);
             while jumlah < 0 do 
             begin 
               writeln('Jumlah tidak boleh negatif!');
               write('Masukkan jumlah tiket: ');
               readln(jumlah);
             end;

             if jumlah = 0 then
               batal := true;
           end;

           if not batal then
           begin
             subtotal := hargaKonser[pilihKonser] * jumlah;

             { Contoh diskon: 10% jika beli 4 tiket atau lebih }
             if jumlah >= 4 then
               diskon := subtotal div 10
             else
               diskon := 0;

             total := subtotal - diskon;

             writeln;
             writeln('Konser   : ', namaKonser[pilihKonser]);
             writeln('Jumlah   : ', jumlah);
             writeln('Subtotal : Rp', subtotal);
             writeln('Diskon   : Rp', diskon);
             writeln('Total    : Rp', total);

             namaTerakhir := namaKonser[pilihKonser];
             totalTerakhir := total;
             adaPesanan := true;
           end
           else
             writeln('Pemesanan dibatalkan.');

           writeln;
           write('Tekan Enter untuk kembali...');
           readln;
         end;

      3: begin
           writeln;
           if adaPesanan then
           begin
             writeln('Pesanan Terakhir');
             writeln('Konser : ', namaTerakhir);
             writeln('Total  : Rp', totalTerakhir);
           end
           else
             writeln('Belum ada pesanan.');
           writeln;
           write('Tekan Enter untuk kembali...');
           readln;
         end;

      4: writeln('Terima kasih telah menggunakan Tixora!');
    else
      begin
        writeln('Menu tidak valid!');
        write('Tekan Enter untuk kembali...');
        readln;
      end;
    end;
  until pilihan = 4;
end.