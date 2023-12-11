import SwiftUI

extension Color {
    static let lightBlue = Color(red: 137 / 255, green: 207 / 255, blue: 240 / 255)
    static let lightGrey = Color(red: 211 / 255, green: 211 / 255, blue: 211 / 255)
}

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Prayer Times", systemImage: "clock")
                }

            QuranView()
                .tabItem {
                    Label("Quran", systemImage: "book.fill")
                }
        }
        .accentColor(Color.lightBlue)
    }
}

struct QuranView: View {
    let surahs = [
         "Al-Fatiha", "Al-Baqarah", "Al-Imran", "An-Nisa", "Al-Ma'idah", "Al-An'am",
         "Al-A'raf", "Al-Anfal", "At-Tawbah", "Yunus", "Hud", "Yusuf", "Ar-Ra'd",
         "Ibrahim", "Al-Hijr", "An-Nahl", "Al-Isra", "Al-Kahf", "Maryam", "Ta-Ha",
         "Al-Anbiya", "Al-Hajj", "Al-Mu'minun", "An-Nur", "Al-Furqan", "Ash-Shu'ara",
         "An-Naml", "Al-Qasas", "Al-Ankabut", "Ar-Rum", "Luqman", "As-Sajdah",
         "Al-Ahzab", "Saba", "Fatir", "Ya-Sin", "As-Saffat", "Sad", "Az-Zumar",
         "Ghafir", "Fussilat", "Ash-Shura", "Az-Zukhruf", "Ad-Dukhan", "Al-Jathiyah",
         "Al-Ahqaf", "Muhammad", "Al-Fath", "Al-Hujurat", "Qaf", "Adh-Dhariyat",
         "At-Tur", "An-Najm", "Al-Qamar", "Ar-Rahman", "Al-Waqi'ah", "Al-Hadid",
         "Al-Mujadilah", "Al-Hashr", "Al-Mumtahanah", "As-Saff", "Al-Jumu'ah",
         "Al-Munafiqun", "At-Taghabun", "At-Talaq", "At-Tahrim", "Al-Mulk", "Al-Qalam",
         "Al-Haqqah", "Al-Ma'arij", "Nuh", "Al-Jinn", "Al-Muzzammil", "Al-Muddathir",
         "Al-Qiyamah", "Al-Insan", "Al-Mursalat", "An-Naba", "An-Nazi'at", "Abasa",
         "At-Takwir", "Al-Infitar", "Al-Mutaffifin", "Al-Inshiqaq", "Al-Buruj",
         "At-Tariq", "Al-A'la", "Al-Ghashiyah", "Al-Fajr", "Al-Balad", "Ash-Shams",
         "Al-Layl", "Ad-Duha", "Ash-Sharh", "At-Tin", "Al-Alaq", "Al-Qadr", "Al-Bayyinah",
         "Az-Zalzalah", "Al-Adiyat", "Al-Qari'ah", "At-Takathur", "Al-Asr", "Al-Humazah",
         "Al-Fil", "Quraish", "Al-Ma'un", "Al-Kawthar", "Al-Kafirun", "An-Nasr",
         "Al-Masad", "Al-Ikhlas", "Al-Falaq", "An-Nas"
     ]

    // Update this dictionary with the actual text for each Surah
    let surahTexts: [String: String] = [
        "Al-Fatiha":"بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ ١ ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ ٢ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ ٣ مَـٰلِكِ يَوْمِ ٱلدِّينِ ٤ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ٥ ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ ٦ صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآءِلِينَ ٧",
        "Al-Baqarah": "الٓمٓ ١ ذَٰلِكَ ٱلْكِتَـٰبُ لَا رَيْبَ ۛ فِيهِ ۛ هُدًۭى لِّلْمُتَّقِينَ ٢ ٱلَّذِينَ يُؤْمِنُونَ بِٱلْغَيْبِ وَيُقِيمُونَ ٱلصَّلَوٰةَ وَمِمَّا رَزَقْنَـٰهُمْ يُنفِقُونَ ٣ وَٱلَّذِينَ يُؤْمِنُونَ بِمَآ أُنزِلَ إِلَيْكَ وَمَآ أُنزِلَ مِن قَبْلِكَ وَبِٱلْـَٔاخِرَةِ هُمْ يُوقِنُونَ ٤ أُو۟لَـٰٓئِكَ عَلَىٰ هُدًۭى مِّن رَّبِّهِمْ ۖ وَأُو۟لَـٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ ٥ إِنَّ ٱلَّذِينَ كَفَرُوا۟ سَوَآءٌ عَلَيْهِمْ ءَأَنذَرْتَهُمْ أَمْ لَمْ تُنذِرْهُمْ لَا يُؤْمِنُونَ ٦ خَتَمَ ٱللَّهُ عَلَىٰ قُلُوبِهِمْ وَعَلَىٰ سَمْعِهِمْ ۖ وَعَلَىٰٓ أَبْصَـٰرِهِمْ غِشَـٰوَةٌۭ ۖ وَلَهُمْ عَذَابٌ عَظِيمٌۭ ٧ وَمِنَ ٱلنَّاسِ مَن يَقُولُ ءَامَنَّا بِٱللَّهِ وَبِٱلْيَوْمِ ٱلْـَٔاخِرِ وَمَا هُم بِمُؤْمِنِينَ ٨ يُخَـٰدِعُونَ ٱللَّهَ وَٱلَّذِينَ ءَامَنُوا۟ وَمَا يَخْدَعُونَ إِلَّآ أَنفُسَهُمْ وَمَا يَشْعُرُونَ ٩ فِى قُلُوبِهِم مَّرَضٌۭ فَزَادَهُمُ ٱللَّهُ مَرَضًۭا ۖ وَلَهُمْ عَذَابٌ أَلِيمٌۢ بِمَا كَانُوا۟ يَكْذِبُونَ ١٠ وَإِذَا قِيلَ لَهُمْ لَا تُفْسِدُوا۟ فِى ٱلْأَرْضِ قَالُوٓا۟ إِنَّمَا نَحْنُ مُصْلِحُونَ ١١ أَلَآ إِنَّهُمْ هُمُ ٱلْمُفْسِدُونَ وَلَـٰكِن لَّا يَشْعُرُونَ ١٢ وَإِذَا قِيلَ لَهُمْ ءَامِنُوا۟ كَمَآ ءَامَنَ ٱلنَّاسُ قَالُوٓا۟ أَنُؤْمِنُ كَمَآ ءَامَنَ ٱلسُّفَهَآءُ ۗ أَلَآ إِنَّهُمْ هُمُ ٱلسُّفَهَآءُ وَلَـٰكِن لَّا يَعْلَمُونَ ١٣ وَإِذَا لَقُوا۟ ٱلَّذِينَ ءَامَنُوا۟ قَالُوٓا۟ ءَامَنَّا وَإِذَا خَلَوْا۟ إِلَىٰ شَيَـٰطِينِهِمْ قَالُوٓا۟ إِنَّا مَعَكُمْ إِنَّمَا نَحْنُ مُسْتَهْزِءُونَ ١٤ ٱللَّهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِى طُغْيَـٰنِهِمْ يَعْمَهُونَ ١٥ أُو۟لَـٰٓئِكَ ٱلَّذِينَ ٱشْتَرَوُا۟ ٱلضَّلَـٰلَةَ بِٱلْهُدَىٰ فَمَا رَبِحَت تِّجَـٰرَتُهُمْ وَمَا كَانُوا۟ مُهْتَدِينَ ١٦ مَثَلُهُمْ كَمَثَلِ ٱلَّذِى ٱسْتَوْقَدَ نَارًۭا فَلَمَّآ أَضَآءَتْ مَا حَوْلَهُۥ ذَهَبَ ٱللَّهُ بِنُورِهِمْ وَتَرَكَهُمْ فِى ظُلُمَـٰتٍۢ لَّا يُبْصِرُونَ ١٧ صُمٌّۢ بُكْمٌ عُمْىٌۭ فَهُمْ لَا يَرْجِعُونَ ١٨ أَوْ كَصَيِّبٍۢ مِّنَ ٱلسَّمَآءِ فِيهِ ظُلُمَـٰتٌۭ وَرَعْدٌۭ وَبَرْقٌۭ يَجْعَلُونَ أَصَـٰبِعَهُمْ فِىٓ ءَاذَانِهِم مِّنَ ٱلصَّوَٰعِقِ حَذَرَ ٱلْمَوْتِ ۚ وَٱللَّهُ مُحِيطٌۢ بِٱلْكَـٰفِرِينَ ١٩ يَكَادُ ٱلْبَرْقُ يَخْطَفُ أَبْصَـٰرَهُمْ ۖ كُلَّمَآ أَضَآءَ لَهُم مَّشَوْا۟ فِيهِ وَإِذَآ أَظْلَمَ عَلَيْهِمْ قَامُوا۟ ۚ وَلَوْ شَآءَ ٱللَّهُ لَذَهَبَ بِسَمْعِهِمْ وَأَبْصَـٰرِهِمْ ۚ إِنَّ ٱللَّهَ عَلَىٰ كُلِّ شَىْءٍۢ قَدِيرٌۭ ٢٠ يَـٰٓأَيُّهَا ٱلنَّاسُ ٱعْبُدُوا۟ رَبَّكُمُ ٱلَّذِى خَلَقَكُمْ وَٱلَّذِينَ مِن قَبْلِكُمْ لَعَلَّكُمْ تَتَّقُونَ ٢١ ٱلَّذِى جَعَلَ لَكُمُ ٱلْأَرْضَ فِرَٰشًۭا وَٱلسَّمَآءَ بِنَآءًۭ وَأَنزَلَ مِنَ ٱلسَّمَآءِ مَآءًۭ فَأَخْرَجَ بِهِۦ مِنَ ٱلثَّمَرَٰتِ رِزْقًۭا لَّكُمْ ۖ فَلَا تَجْعَلُوا۟ لِلَّهِ أَندَادًۭا وَأَنتُمْ تَعْلَمُونَ ٢٢ وَإِن كُنتُمْ فِى رَيْبٍۢ مِّمَّا نَزَّلْنَا عَلَىٰ عَبْدِنَا فَأْتُوا۟ بِسُورَةٍۢ مِّن مِّثْلِهِۦ وَٱدْعُوا۟ شُهَدَآءَكُم مِّن دُونِ ٱللَّهِ إِن كُنتُمْ صَـٰدِقِينَ ٢٣ فَإِن لَّمْ تَفْعَلُوا۟ وَلَن تَفْعَلُوا۟ فَٱتَّقُوا۟ ٱلنَّارَ ٱلَّتِى وَقُودُهَا ٱلنَّاسُ وَٱلْحِجَارَةُ ۖ أُعِدَّتْ لِلْكَـٰفِرِينَ ٢٤",
        "Al-Imran": "الموَإِذْ أَخَذَ ٱللَّهُ مِيثَـٰقَ ٱلَّذِينَ أُوتُوا۟ ٱلْكِتَـٰبَ لَتُبَيِّنُنَّهُۥ لِلنَّاسِ وَلَا تَكْتُمُونَهُۥ فَنَبَذُوهُ وَرَآءَ ظُهُورِهِمْ وَٱشْتَرَوْا۟ بِهِۦ ثَمَنًۭا قَلِيلًۭا ۖ فَبِئْسَ مَا يَشْتَرُونَ ١٨٧ لَا تَحْسَبَنَّ ٱلَّذِينَ يَفْرَحُونَ بِمَآ أَتَوا۟ وَّيُحِبُّونَ أَن يُحْمَدُوا۟ بِمَا لَمْ يَفْعَلُوا۟ فَلَا تَحْسَبَنَّهُم بِمَفَازَةٍۢ مِّنَ ٱلْعَذَابِ ۖ وَلَهُمْ عَذَابٌ أَلِيمٌۭ ١٨٨ وَلِلَّهِ مُلْكُ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضِ ۗ وَٱللَّهُ عَلَىٰ كُلِّ شَىْءٍۢ قَدِيرٌ ١٨٩ إِنَّ فِى خَلْقِ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضِ وَٱخْتِلَـٰفِ ٱلَّيْلِ وَٱلنَّهَارِ لَـَٔايَـٰتٍۢ لِّأُو۟لِى ٱلْأَلْبَـٰبِ ١٩٠ ٱلَّذِينَ يَذْكُرُونَ ٱللَّهَ قِيَـٰمًۭا وَقُعُودًۭا وَعَلَىٰ جُنُوبِهِمْ وَيَتَفَكَّرُونَ فِى خَلْقِ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضِ رَبَّنَا مَا خَلَقْتَ هَـٰذَا بَـٰطِلًۭا سُبْحَـٰنَكَ فَقِنَا عَذَابَ ٱلنَّارِ ١٩١ رَبَّنَآ إِنَّكَ مَن تُدْخِلِ ٱلنَّارَ فَقَدْ أَخْزَيْتَهُۥ ۖ وَمَا لِلظَّـٰلِمِينَ مِنْ أَنصَارٍۢ ١٩٢ رَّبَّنَآ إِنَّنَا سَمِعْنَا مُنَادِيًۭا يُنَادِى لِلْإِيمَـٰنِ أَنْ ءَامِنُوا۟ بِرَبِّكُمْ فَـَٔامَنَّا ۚ رَبَّنَا فَٱغْفِرْ لَنَا ذُنُوبَنَا وَكَفِّرْ عَنَّا سَيِّـَٔاتِنَا وَتَوَفَّنَا مَعَ ٱلْأَبْرَارِ ١٩٣ رَبَّنَا وَءَاتِنَا مَا وَعَدتَّنَا عَلَىٰ رُسُلِكَ وَلَا تُخْ",
        "An-Nas": "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ ١ مَلِكِ ٱلنَّاسِ ٢ إِلَـٰهِ ٱلنَّاسِ ٣ مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ ٤ ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ ٥ مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ ٦",
        "Al-Falaq": "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ ١ مَلِكِ ٱلنَّاسِ ٢ إِلَـٰهِ ٱلنَّاسِ ٣ مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ ٤ ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ ٥ مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ ٦",
        "Al-Fil":"أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَـٰبِ ٱلْفِيلِ ١ أَلَمْ يَجْعَلْ كَيْدَهُمْ فِى تَضْلِيلٍۢ ٢ وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ ٣ تَرْمِيهِم بِحِجَارَةٍۢ مِّن سِجِّيلٍۢ ٤ فَجَعَلَهُمْ كَعَصْفٍۢ مَّأْكُولٍۭ ٥",
        "Quraish":"لِإِيلَـٰفِ قُرَيْشٍ ١ إِۦلَـٰفِهِمْ رِحْلَةَ ٱلشِّتَآءِ وَٱلصَّيْفِ ٢ فَلْيَعْبُدُوا۟ رَبَّ هَـٰذَا ٱلْبَيْتِ ٣ ٱلَّذِىٓ أَطْعَمَهُم مِّن جُوعٍۢ وَءَامَنَهُم مِّنْ خَوْفٍۭ ٤",
        "Al-Ma'un":"أَرَءَيْتَ ٱلَّذِى يُكَذِّبُ بِٱلدِّينِ ١ فَذَٰلِكَ ٱلَّذِى يَدُعُّ ٱلْيَتِيمَ ٢ وَلَا يَحُضُّ عَلَىٰ طَعَامِ ٱلْمِسْكِينِ ٣ فَوَيْلٌۭ لِّلْمُصَلِّينَ ٤ ٱلَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ ٥ ٱلَّذِينَ هُمْ يُرَآءُونَ ٦ وَيَمْنَعُونَ ٱلْمَاعُونَ ٧",
        "Al-Kawthar":"إِنَّآ أَعْطَيْنَـٰكَ ٱلْكَوْثَرَ ١ فَصَلِّ لِرَبِّكَ وَٱنْحَرْ ٢ إِنَّ شَانِئَكَ هُوَ ٱلْأَبْتَرُ ٣",
        "Al-Kafirun": "قُلْ يَـٰٓأَيُّهَا ٱلْكَـٰفِرُونَ ١ لَآ أَعْبُدُ مَا تَعْبُدُونَ ٢ وَلَآ أَنتُمْ عَـٰبِدُونَ مَآ أَعْبُدُ ٣ وَلَآ أَنَا۠ عَابِدٌۭ مَّا عَبَدتُّمْ ٤ وَلَآ أَنتُمْ عَـٰبِدُونَ مَآ أَعْبُدُ ٥ لَكُمْ دِينُكُمْ وَلِىَ دِينِ ٦",
        "An-Nasr": "إِذَا جَآءَ نَصْرُ ٱللَّهِ وَٱلْفَتْحُ ١ وَرَأَيْتَ ٱلنَّاسَ يَدْخُلُونَ فِى دِينِ ٱللَّهِ أَفْوَاجًۭا ٢ فَسَبِّحْ بِحَمْدِ رَبِّكَ وَٱسْتَغْفِرْهُ ۚ إِنَّهُۥ كَانَ تَوَّابًۢا ٣",
        "Al-Masad": "تَبَّتْ يَدَآ أَبِى لَهَبٍۢ وَتَبَّ ١ مَآ أَغْنَىٰ عَنْهُ مَالُهُۥ وَمَا كَسَبَ ٢ سَيَصْلَىٰ نَارًۭا ذَاتَ لَهَبٍۢ ٣ وَٱمْرَأَتُهُۥ حَمَّالَةَ ٱلْحَطَبِ ٤ فِى جِيدِهَا حَبْلٌۭ مِّن مَّسَدٍۭ ٥" ,
        "Al-Ikhlas": " قُلْ هُوَ ٱللَّهُ أَحَدٌ ١ ٱللَّهُ ٱلصَّمَدُ ٢ لَمْ يَلِدْ وَلَمْ يُولَدْ ٣ وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ ٤",
        
    ]
    func printTextWithLines(text: String) {
        let line = String(repeating: "-", count: text.count)
        print(text)
        print(line)
    }

    // Example usage:
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("بِسْمِ اللَّٰهِ الرَّحْمَٰنِ الرَّحِيمِ")
                    .font(.custom("Amiri-Bold", size: 40)) // Use the custom font here
                    .padding(.top, 40)
                    .padding(.bottom, 40)

                HStack(spacing: 5) {
                    VStack {
                        Text("Continue Reading")
                            .fontWeight(.semibold)
                        Text("Surah Al-Nisa")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 10)

                    VStack {
                        Text("Continue Reciting")
                            .fontWeight(.semibold)
                        Text("Surah Al-A'raf")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 10)
                }

                Spacer(minLength: 15)

                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(surahs, id: \.self) { surah in
                            NavigationLink(destination: SurahDetailView(surahName: surah, surahText: surahTexts[surah] ?? "Text not found")) {
                                Text(surah)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.blue, lineWidth: 2) // Customize the color and lineWidth as desired
                                                    )
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .font(.custom("Amiri-Bold", size: 25)) // Use the custom font here

                            }
                            .padding(.horizontal, 10)
                            Divider() // Add a divider between each Text view
                                      .background(Color.blue)
                        }
                    }
                }
                .padding(.bottom, 10)
            }
            .background(Color.lightGrey.ignoresSafeArea())
            .navigationBarTitle("Quran", displayMode: .inline)
        }
    }
}
import SwiftUI

struct SurahDetailView: View {
    var surahName: String
    var surahText: String

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .center, spacing: 15) {
                    Text(surahName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding([.top, .horizontal])
                        .padding(.top, 70) // Extra padding for the notch area

                    Text("بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ") // Bismillah in Arabic
                        .font(.title2)
                        .foregroundColor(Color.gray)
                        .padding(.bottom,20)

                    ArabicTextWithLines(text: surahText)
                }
            }

            Divider()
                .background(Color.gray.opacity(0.5))

            HStack {
                Button("Previous Surah") {
                    // Action for Previous Surah
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.blue)

                Button("Next Surah") {
                    // Action for Next Surah
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.blue)
            }
            .padding(.bottom, 100) // Extra padding for the bottom safe area
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ArabicTextWithLines: View {
    var text: String

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                let sentences = text.split(separator: "  ")

                ForEach(0..<sentences.count, id: \.self) { index in
                    Text(sentences[index])
                        .font(.custom("Amiri-Bold", size: 24)) // Adjusted for better readability on smaller screens
                        .lineSpacing(8)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 2)
                                .shadow(color: Color.blue.opacity(0.5), radius: 3, x: 0, y: 2)
                        )
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct SurahDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SurahDetailView(surahName: "Example Surah", surahText: "Example text")
    }
}



struct MainView: View {
    @State private var currentTime = getCurrentTime()

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                HeaderView()
                CurrentTimeView(currentTime: $currentTime)
                PrayerScheduleView()
                FooterView()

                Spacer()
            }
            .padding(.horizontal, 10)

            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                    currentTime = MainView.getCurrentTime()
                }
            }
        }
    }
    
    struct SurahDetailView: View {
        var surahName: String
        var surahText: String

        var body: some View {
            ScrollView {
                VStack {
                    Text(surahName)
                        .font(.title)
                        .padding()

                    Text(surahText)
                        .font(.custom("Amiri", size: 20))                        .padding()
                }
            }
        }
    }

    

    static func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: Date())
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("ICCSC Prayer Times")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 5)

            HStack {
                Text("Fort Mill, South Carolina")
                Spacer()
                Text("Sat Dec 09, 2023")
            }
            .font(.subheadline)
            .padding(.bottom, 7)
            .padding(.horizontal, 15)
        }
        .padding()
        .background(Color.lightBlue)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct FooterView: View {
    var body: some View {
        VStack {
            Text("''Prayer is the first thing you will be questioned about, so do not make it the last thing on your mind.''")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 5)

            Button(action: {
                // Action for the "Sign up" button
            }) {
                Text("Sign up »")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.lightBlue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 5)
            .padding(.horizontal, 30)
        }
        .padding()
        .background(Color.lightGrey)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct PrayerScheduleView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Prayer")
                    .font(.headline)
                    .frame(width: 100, alignment: .leading)
                Text("Adhan")
                    .font(.headline)
                    .frame(width: 100, alignment: .leading)
                Text("Iqamah")
                    .font(.headline)
                    .frame(width: 100, alignment: .leading)
            }
            .padding(10)
            .background(Color.lightBlue)
            .foregroundColor(.white)
            .cornerRadius(10)

            ScrollView {
                ForEach(prayerTimes, id: \.self) { prayerTime in
                    PrayerRowView(prayerTime: prayerTime)
                }
            }
        }
        .padding(.top, 0)
    }
}

struct PrayerRowView: View {
    var prayerTime: PrayerTime

    var body: some View {
        HStack {
            Text(prayerTime.prayer)
                .frame(width: 100, alignment: .leading)
            Text(prayerTime.adhan)
                .frame(width: 100, alignment: .leading)
            Text(prayerTime.iqamah)
                .frame(width: 100, alignment: .leading)
        }
        .padding(10)
        .background(Color.lightGrey)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal, 10)
    }
}

// Example data model
struct PrayerTime: Hashable {
    let prayer: String
    let adhan: String
    let iqamah: String
    let backgroundColor: Color
}

// Sample data
let prayerTimes = [
    PrayerTime(prayer: "Fajr", adhan: "5:48", iqamah: "6:15", backgroundColor: .white),
    PrayerTime(prayer: "Dhuhr", adhan: "12:30", iqamah: "12:45", backgroundColor: .white),
    PrayerTime(prayer: "Asr", adhan: "3:45", iqamah: "4:00", backgroundColor: .white),
    PrayerTime(prayer: "Maghrib", adhan: "5:55", iqamah: "6:05", backgroundColor: .white),
    PrayerTime(prayer: "Isha", adhan: "8:00", iqamah: "8:15", backgroundColor: .white),
]

struct CurrentTimeView: View {
    @Binding var currentTime: String

    var body: some View {
        Text(currentTime)
            .font(.headline)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.vertical, 10)
    }
}
