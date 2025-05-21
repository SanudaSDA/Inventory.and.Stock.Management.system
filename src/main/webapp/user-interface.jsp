<%--
  Created by IntelliJ IDEA.
  User: Dulmi Madusha
  Date: 5/11/2025
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Inventory Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .sidebar .nav-link {
            color: #555;
            transition: all 0.3s ease;
        }
        .sidebar .nav-link:hover {
            color: #0d6efd;
            background-color: #f0f4ff;
            border-radius: 6px;
        }
        .sidebar .nav-link.active {
            color: #ffffff;
            background-color: #0d6efd;
            border-radius: 6px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .card h5 {
            font-size: 1rem;
            color: #6c757d;
        }
        .card p {
            font-size: 1.5rem;
            font-weight: bold;
            color: #0d6efd;
        }
        .profile-icon {
            width: 40px;
            height: 40px;
            background-color: #0d6efd;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 1.2rem;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block sidebar py-4">
            <div class="text-center mb-4">
                <h2 class="text-primary">Inventory</h2>
            </div>
            <ul class="nav flex-column px-3">
                <li class="nav-item mb-2">
                    <a class="nav-link active" href="#"><i class="bi bi-speedometer2 me-2"></i>Dashboard</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="#"><i class="bi bi-box-seam me-2"></i>Inventory</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="#"><i class="bi bi-cart me-2"></i>Sales</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="#"><i class="bi bi-bag-plus me-2"></i>Purchases</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="#"><i class="bi bi-people me-2"></i>Suppliers</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="#"><i class="bi bi-graph-up me-2"></i>Reports</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link" href="#"><i class="bi bi-folder me-2"></i>Documents</a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto px-md-4 py-4">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center pb-3 mb-4 border-bottom">
                <h1 class="h2 text-primary">Dashboard</h1>
                <div class="d-flex align-items-center gap-3">
                    <input type="text" class="form-control" style="width: 250px;" placeholder="Search...">
                    <!-- ✅ FIXED: Profile link now goes to ProfileServlet -->
                    <a href="profile" class="profile-icon" title="My Profile">
                        <i class="bi bi-person"></i>
                    </a>
                </div>
            </div>

            <!-- Quick Stats -->
            <div class="row mb-4">
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h5>To be Packed</h5>
                        <p>228</p>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h5>To be Shipped</h5>
                        <p>6</p>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h5>To be Delivered</h5>
                        <p>10</p>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h5>To be Invoiced</h5>
                        <p>474</p>
                    </div>
                </div>
            </div>

            <!-- Product Details -->
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card p-3">
                        <h5>Product Details</h5>
                        <ul class="list-unstyled">
                            <li>Low Stock Items: <span class="text-danger fw-bold">3</span></li>
                            <li>All Item Groups: 39</li>
                            <li>All Items: 190</li>
                            <li>Unconfirmed Items: 121</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card p-3">
                        <h5>Top Selling Items</h5>
                        <ul class="list-unstyled">
                            <li>Orange Jacket - 171 pcs</li>
                            <li>Purple Romper - 45 sets</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card p-3">
                        <h5>Sales Order</h5>
                        <ul class="list-unstyled">
                            <li>Draft: 0</li>
                            <li>Confirmed: 50</li>
                            <li>Packed: 0</li>
                            <li>Shipped: 0</li>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

