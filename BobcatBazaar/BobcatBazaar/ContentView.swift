//
//  ContentView.swift
//  BobcatBazaar
//
//  Created by Perkinson, Kendall on 4/16/25.
//

    // Bobcat Bazaar - Full SwiftUI Code with ContentView
// Bobcat Bazaar App - Enhanced Home UI
import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            MainTabView()
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
           
    }
}
  

// MARK: - Login Screen
struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var netID = ""
    @State private var password = ""

    
    
    
    
    
    var body: some View {

            VStack(spacing: 20) {
                Text("Bobcat Bazaar")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(red: 80/255, green: 18/255, blue: 20/255))
                
                TextField("NetID", text: $netID)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button("Login") {
                    isLoggedIn = true
                }
                .padding()
                .background(Color(red: 172/255, green: 145/255, blue: 85/255))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }

       
}

// MARK: - Main Tabs
struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

// MARK: - Business Model
struct StudentBusiness: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let description: String
    let popularProduct: String
    let imageName: String
}

let studentBusinesses: [StudentBusiness] = [
    StudentBusiness(name: "HennyMakes", category: "Fashion & Accessories", description: "Bead-embroidered shirts, jewelry, and more by Hensa Camacho.", popularProduct: "Beaded Statement Shirt", imageName: "hennymakes"),
    StudentBusiness(name: "HardToReenact", category: "Fashion & Accessories", description: "Art meets fashion—unique, wearable expressions.", popularProduct: "Custom Designed Tops", imageName: "hardtoreenact"),
    StudentBusiness(name: "Cupped Up", category: "Food & Lifestyle", description: "Layered treats in elegant dome cups—perfect for any occasion.", popularProduct: "Strawberry Shortcake Cup", imageName: "cuppedup"),
    StudentBusiness(name: "Jets3DPrints", category: "Services", description: "Custom 3D-printed designs and handcrafted pieces.", popularProduct: "3D-Printed Keychains", imageName: "jets3dprints"),
    StudentBusiness(name: "Auguri", category: "Fashion & Accessories", description: "Elegant, sophisticated handbag accessories to empower your look.", popularProduct: "Luxury Handbag Charms", imageName: "auguri"),
    StudentBusiness(name: "RB Crochet Co.", category: "Fashion & Accessories", description: "Handmade cozy crochet gifts and accessories.", popularProduct: "Crochet Bucket Hat", imageName: "rbcrochetco"),
    StudentBusiness(name: "EZ-T Vintage", category: "Fashion & Accessories", description: "Curated vintage streetwear—sustainable & stylish.", popularProduct: "Vintage Graphic Tee", imageName: "eztvintage"),
    StudentBusiness(name: "Board Bound Wake Co.", category: "Services", description: "Wakeboarding, tubing, and private charters. Now in Dallas!", popularProduct: "Private Lake Day Experience", imageName: "boardboundwakeco"),
    StudentBusiness(name: "Libra Stitches", category: "Fashion & Accessories", description: "Handcrafted plushies and accessories with heart.", popularProduct: "Crochet Plush Animals", imageName: "librastitches"),
    StudentBusiness(name: "The Freshie Spot", category: "Personal Care", description: "Custom car fresheners made at TXST—scents, shapes, & more.", popularProduct: "Sunflower Freshie", imageName: "thefreshiespot"),
    StudentBusiness(name: "Are You Hungry Yet?", category: "Food & Lifestyle", description: "Homemade cookies, cakes, brownies & more—baked with love.", popularProduct: "Chewy Chocolate Chip Cookies", imageName: "areyouhungryyet"),
    StudentBusiness(name: "Central Texas Detailing", category: "Services", description: "Mobile car detailing with expert care & convenience.", popularProduct: "Interior Deep Clean", imageName: "centraltexasdetailing"),
    StudentBusiness(name: "The Twin Braiders", category: "Services", description: "Culturally rich braiding services inspired by Nigerian roots.", popularProduct: "Knotless Braids", imageName: "thetwinbraiders"),
    StudentBusiness(name: "Hot Spots Locating", category: "Services", description: "Helps students find rentals, negotiate leases, and move stress-free.", popularProduct: "First-Time Renter Package", imageName: "hotspotslocating"),
    StudentBusiness(name: "Green Pastures", category: "Food & Lifestyle", description: "Flavorful micro-greens for a vibrant, healthy lifestyle.", popularProduct: "Micro-Green Sampler", imageName: "greenpastures"),
    StudentBusiness(name: "ThriftedFuego", category: "Fashion & Accessories", description: "Sustainable fashion and one-of-a-kind statement pieces.", popularProduct: "Retro Windbreaker", imageName: "thriftedfuego"),
    StudentBusiness(name: "Faith's Crafts", category: "Fashion & Accessories", description: "Crochet scarves, headphones, bags & more by Faith.", popularProduct: "Crochet Shoulder Bag", imageName: "faithscrafts"),
    StudentBusiness(name: "Repentful Soul", category: "Fashion & Accessories", description: "Faith-based streetwear with an empowering message.", popularProduct: "Repentful Soul Hoodie", imageName: "repentfulsoul"),
    StudentBusiness(name: "Walker's Sneakers", category: "Fashion & Accessories", description: "Buy, sell, and trade sneakers since high school.", popularProduct: "Air Jordan 1 Retro", imageName: "walkerssneakers")
]




// MARK: - Featured Card View
struct FeaturedCardView: View {
    let business: StudentBusiness

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(business.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 280, height: 160)
                .clipped()
                .cornerRadius(20)

            VStack(alignment: .leading, spacing: 8) {
                Text(business.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(business.category)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                Text(business.popularProduct)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .background(Color.black.opacity(0.4))
            .cornerRadius(15)
            .padding()
        }
        .shadow(radius: 5)
    }
}


// MARK: - Grid Card View
struct GridCardView: View {
    let business: StudentBusiness

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(business.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .clipped()
                .cornerRadius(10)

            Text(business.name)
                .font(.headline)
                .foregroundColor(.primary)

            Text(business.popularProduct)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// MARK: - Search View
struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    let categories = ["All", "Fashion & Accessories", "Services", "Food & Lifestyle", "Personal Care"]

    var filteredBusinesses: [StudentBusiness] {
        studentBusinesses.filter { business in
            (selectedCategory == "All" || business.category == selectedCategory) &&
            (searchText.isEmpty || business.name.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Category Filters
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                                    .font(.subheadline)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(selectedCategory == category ? Color("TXSTMaroon") : Color.gray.opacity(0.2))
                                    .foregroundColor(selectedCategory == category ? .white : .primary)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)

                // Search Bar
                TextField("Search products or shops", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top, 5)

                // Business Results
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredBusinesses) { business in
                            ProductCardView(business: business)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Search")
        }
    }
}


// MARK: - Cart Item Model
struct CartItem: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    var quantity: Int
    let imageName: String
}

// MARK: - Cart View
struct CartView: View {
    @State private var cartItems: [CartItem] = [
        CartItem(name: "Beaded Statement Shirt", price: 45.00, quantity: 1, imageName: "hennymakes"),
        CartItem(name: "Luxury Handbag Charm", price: 30.00, quantity: 1, imageName: "auguri"),
        CartItem(name: "Crochet Bucket Hat", price: 25.00, quantity: 2, imageName: "rbcrochetco")
    ]
    
    var total: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }

    var body: some View {
        NavigationView {
            VStack {
                if cartItems.isEmpty {
                    Spacer()
                    VStack(spacing: 16) {
                        Image(systemName: "cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        Text("Your cart is empty")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(cartItems.indices, id: \.self) { index in
                            CartItemRow(item: $cartItems[index], onRemove: {
                                cartItems.remove(at: index)
                            })
                        }
                    }
                    .listStyle(InsetGroupedListStyle())

                    VStack(spacing: 12) {
                        HStack {
                            Text("Total:")
                                .font(.title3)
                            Spacer()
                            Text("$\(total, specifier: "%.2f")")
                                .font(.title3)
                                .bold()
                        }
                        .padding(.horizontal)

                        Button(action: {
                            // Checkout action placeholder
                        }) {
                            Text("Checkout")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 80/255, green: 18/255, blue: 20/255))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("Your Cart")
        }
    }
}

// MARK: - Cart Item Row View
struct CartItemRow: View {
    @Binding var item: CartItem
    var onRemove: () -> Void

    var body: some View {
        HStack(spacing: 15) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price, specifier: "%.2f") each")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Stepper("", value: $item.quantity, in: 1...10)
                .labelsHidden()
                .frame(width: 80)

            Button(action: onRemove) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Profile View
struct ProfileView: View {
    @State private var isSeller = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Profile Image and Name
                    VStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.accentColor)
                            .padding(.top)

                        Text(isSeller ? "Perk Up Coffee" : "Kendall Perkinson")
                            .font(.title)
                            .bold()

                        Text(isSeller ? "Brewing smiles, one cup at a time." : "Just a student who loves coffee & cute shops!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                    // Profile Info Card
                    VStack(spacing: 16) {
                        Text("Profile Details")
                            .font(.headline)
                            .padding(.bottom, 4)

                        if isSeller {
                            VStack(alignment: .leading, spacing: 12) {
                                InfoRow(title: "Category", value: "Food & Lifestyle")
                                InfoRow(title: "Popular Item", value: "Cold Brew & Matcha Cookies")
                                InfoRow(title: "Website", value: "www.perkupcoffee.com")
                                InfoRow(title: "Instagram", value: "@perkupcoffee.txst")
                            }
                        } else {
                            VStack(alignment: .leading, spacing: 12) {
                                InfoRow(title: "Favorites", value: "Perk Up Coffee, Cat Crafters")
                                InfoRow(title: "Recently Bought", value: "Peachy Pins")
                                InfoRow(title: "Email", value: "kendall@example.com")
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal)

                    // Switch Between Buyer/Seller
                    HStack {
                        Text(isSeller ? "Switch to Buyer" : "Switch to Seller")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        Toggle("", isOn: $isSeller)
                            .toggleStyle(SwitchToggleStyle(tint: Color("TXSTMaroon")))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .background(Color(.systemBackground))
            .navigationTitle("Profile")
        }
    }
}

// MARK: - Helper View for Info Rows
struct InfoRow: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundColor(.gray)

            Text(value)
                .font(.subheadline)
                .foregroundColor(.primary)

            Spacer()
        }
    }
}



// MARK: - Product Card (Used in SearchView)
struct ProductCardView: View {
    let business: StudentBusiness

    var body: some View {
        HStack(spacing: 15) {
            Image(business.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(business.name)
                    .bold()
                Text(business.popularProduct)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background((Color(red: 80/255, green: 18/255, blue: 20/255)).opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Color Extension
extension Color {
    init(_ hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
// MARK: - Home View
struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Featured Shops")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(studentBusinesses.prefix(5)) { business in
                                FeaturedCardView(business: business)
                            }
                        }
                        .padding(.horizontal)
                    }

                    Text("All Shops")
                        .font(.title2)
                        .bold()
                        .padding([.top, .horizontal])

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(studentBusinesses) { business in
                            GridCardView(business: business)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Home")
        }
    }
    

    // MARK: - Business Detail View
    struct BusinessDetailView: View {
        let business: StudentBusiness
        
        // Sample products for demonstration
        private var businessProducts: [Product] {
            // Generate sample products based on the business
            return [
                Product(name: business.popularProduct, price: Double.random(in: 15.0...50.0), imageName: business.imageName),
                Product(name: "\(business.name) Special", price: Double.random(in: 20.0...60.0), imageName: business.imageName),
                Product(name: "Featured Item", price: Double.random(in: 10.0...45.0), imageName: business.imageName),
                Product(name: "Limited Edition", price: Double.random(in: 25.0...75.0), imageName: business.imageName)
            ]
        }
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Business Header
                    VStack(alignment: .center, spacing: 8) {
                        Image(business.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(0)
                            .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 8) {
                            Text(business.name)
                                .font(.title)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            Text(business.category)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(15)
                        }
                        .padding()
                    }
                    
                    // About Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Text(business.description)
                            .font(.body)
                            .padding(.horizontal)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Contact Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Contact")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor((Color(red: 80/255, green: 18/255, blue: 20/255)))
                            Text("contact@\(business.name.lowercased().replacingOccurrences(of: " ", with: "")).com")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "link")
                                .foregroundColor((Color(red: 80/255, green: 18/255, blue: 20/255)))
                            Text("www.\(business.name.lowercased().replacingOccurrences(of: " ", with: "")).com")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor((Color(red: 80/255, green: 18/255, blue: 20/255)))
                            Text("@\(business.name.lowercased().replacingOccurrences(of: " ", with: ""))")
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                    
                    // Products Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Products")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(businessProducts) { product in
                            ProductRow(product: product)
                        }
                    }
                    .padding(.top)
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("Business Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Product Model
    struct Product: Identifiable {
        let id = UUID()
        let name: String
        let price: Double
        let imageName: String
    }

    // MARK: - Product Row
    struct ProductRow: View {
        let product: Product
        @State private var isAddedToCart = false
        
        var body: some View {
            HStack(spacing: 16) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name)
                        .font(.headline)
                    
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    isAddedToCart.toggle()
                }) {
                    Image(systemName: isAddedToCart ? "checkmark.circle.fill" : "plus.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isAddedToCart ? Color.green : (Color(red: 80/255, green: 18/255, blue: 20/255)))
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            .padding(.horizontal)
        }
    }

    // MARK: - Updated Grid Card View with Navigation
    struct GridCardView: View {
        let business: StudentBusiness

        var body: some View {
            NavigationLink(destination: BusinessDetailView(business: business)) {
                VStack(alignment: .leading, spacing: 8) {
                    Image(business.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()
                        .cornerRadius(10)

                    Text(business.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text(business.popularProduct)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }
        }
    }

    // MARK: - Updated Product Card View with Navigation
    struct ProductCardView: View {
        let business: StudentBusiness

        var body: some View {
            NavigationLink(destination: BusinessDetailView(business: business)) {
                HStack(spacing: 15) {
                    Image(business.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(business.name)
                            .bold()
                        Text(business.popularProduct)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
                .padding()
                .background(Color(red: 80/255, green: 18/255, blue: 20/255).opacity(0.1))
                .cornerRadius(12)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }

    // MARK: - Updated Featured Card View with Navigation
    struct FeaturedCardView: View {
        let business: StudentBusiness

        var body: some View {
            NavigationLink(destination: BusinessDetailView(business: business)) {
                ZStack(alignment: .bottomLeading) {
                    Image(business.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 280, height: 160)
                        .clipped()
                        .cornerRadius(20)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(business.name)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(business.category)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                        Text(business.popularProduct)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(15)
                    .padding()
                }
                .shadow(radius: 5)
            }
        }
    }

    // MARK: - Complete StudentBusinesses List View
    struct StudentBusinessesListView: View {
        @State private var searchText = ""
        
        var filteredBusinesses: [StudentBusiness] {
            if searchText.isEmpty {
                return studentBusinesses
            } else {
                return studentBusinesses.filter { business in
                    business.name.lowercased().contains(searchText.lowercased()) ||
                    business.category.lowercased().contains(searchText.lowercased()) ||
                    business.description.lowercased().contains(searchText.lowercased())
                }
            }
        }
        
        var body: some View {
            NavigationView {
                VStack {
                    // Search Bar
                    TextField("Search businesses", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.top, 5)
                    
                    List {
                        ForEach(filteredBusinesses) { business in
                            NavigationLink(destination: BusinessDetailView(business: business)) {
                                HStack(spacing: 15) {
                                    Image(business.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(business.name)
                                            .font(.headline)
                                        
                                        Text(business.category)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Text(business.popularProduct)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 6)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                .navigationTitle("Student Businesses")
            }
        }
    }

    // MARK: - Updated Main Tab View with Business List Tab
    struct MainTabView: View {
        var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }

                StudentBusinessesListView()
                    .tabItem {
                        Label("Businesses", systemImage: "briefcase.fill")
                    }

                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }

                CartView()
                    .tabItem {
                        Label("Cart", systemImage: "cart.fill")
                    }

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
        }
    }

    
    
    
    
}
#Preview {
    ContentView()
}

