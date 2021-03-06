//
//  WeatherSearchTableVC.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 19/06/22.
//

import Foundation
import UIKit

class WeatherSearchTableVC: UITableViewController, UISearchResultsUpdating {
    
    let stocks = ["Abadi","Adiantorop","Airmadidi","Ambarawa","Ambon City","Amlapura","Anggrek","Angkasa","Area","Badung","Bali","Balige","Balikpapan","Banda Aceh","Bandar","Bandar Lampung","Bandung","Bangkalan","Bangkinang","Bangli","Banjar","Banjarbaru","Banjarmasin","Banjarnegara","Bantaeng","Bantan","Bantul","Banyumas","Banyuwangi","Baratjaya","Batang","Batu","Baturaja","Baubau","Bekasi","Bengkalis","Bengkulu","Bima","Binjai","Bitung","Blitar","Blora","Bogor","Bojonegoro","Bondowoso","Bontang","Boyolali","Bukit Tinggi","Bulukumba","Buntok","Cakrawala","Cempaka","Cengkareng","Ciamis","Cianjur","Cibitung","Cibubur","Cihampelas","Cikarang","Cikini","Cilacap","Cilegon","Cilincing","Cimahi","Cimanggis","Cipinanglatihan","Ciputat","Cirebon","Citeureup","Darmaga","Darussalam","Demak","Denpasar","Depok","Depok Jaya","Dumai","Duren","Duri","Gandul","Garut","Gedung","Gianyar","Gorontalo","Gresik","Guntung","Gunungsitoli","Holis","Indo","Indramayu","Jagakarsa","Jakarta","Jambi City","Jayapura","Jember","Jepara","Jimbaran","Jombang","Kabanjahe","Kalideres","Kalimantan","Kandangan","Karanganyar","Karawang","Kartasura","Kebayoran Baru","Kebayoran Lama Selatan","Kebumen","Kediri","Kelapa Dua","Kemang","Kendal","Kepanjen","Kerinci","Kerobokan","Klaten","Kopeng","Kota","Kudus","Kulon","Kuningan","Kupang","Kuta","Lamongan","Lampeong","Langsa","Lapan","Lawang","Lestari","Lhokseumawe","Lubuk Pakam","Lumajang","Madiun","Magelang","Magetan","Mail","Majalengka","Makassar","Malang","Mamuju","Manado","Maros","Mataram","Medan","Mega","Menara","Menteng","Mojoagung","Mojokerto","Muntilan","Negara","Negeribesar","Nganjuk","Ngawi","Nusa","Nusa Dua","Nusantara","Pacitan","Padang","Palaihari","Palangka","Palangkaraya","Palembang","Palu","Pamekasan","Pamulang","Panasuan","Pandeglang","Pangaturan","Parakan","Pare","Parman","Pasuruan","Patam","Pati","Payakumbuh","Pekalongan","Pekan","Pekanbaru","Pemalang","Pematangsiantar","Polerejo","Pondok","Ponorogo","Pontianak","Porsea","Poso","Probolinggo","Purbalingga","Purwakarta","Purwodadi Grobogan","Purwokerto","Purworejo","Pusat","Riau","Salatiga","Samarinda","Sampang","Sampit","Sangereng","Sanur","Sejahtera","Sekupang","Selatan","Selong","Semarang","Sengkang","Sentul","Serang","Serdang","Serpong","Sidoarjo","Sigli","Sijunjung","Simpang","Singaraja","Singkawang","Situbondo","Sleman","Soasio","Soe","Soho","Solo","Sragen","Stabat","Subang","Sukabumi","Sukoharjo","Sumedang","Sungailiat","Sunggal","Sungguminasa","Surabaya","Surabayan","Surakarta","Tabanan","Tangsel","Tanjung","Tanjung Balai","Tanjungpinang","Tarakan","Tasikmalaya","Tebingtinggi","Tegal","Temanggung","Tembagapura","Tengah","Tenggara","Tenggarong","Tigaraksa","Tigarasa","Timur","Tipar Timur","Tirtagangga","Tomohon","Tondano","Trenggalek","Tuban","Tulungagung","Ubud","Udayana","Ungaran","Utama","Utara","Veteran","Wilayah","Wonogiri","Wonosari","Wonosobo","Yogyakarta"]
    
    var filteredWeathers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .primary
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredWeathers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //as! SearchTableViewCell
        cell.textLabel?.text = filteredWeathers[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .accent
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let inputText = searchController.searchBar.text, !inputText.isEmpty {
            filteredWeathers = stocks.filter({ (text) -> Bool in
                return text.lowercased().contains(inputText.lowercased())
            })
        }
          
        tableView.reloadData()
    }
    
}
