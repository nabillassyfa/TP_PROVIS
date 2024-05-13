from fastapi import FastAPI, HTTPException
from typing import List
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
from os import path

app = FastAPI(title="Web service TPPTOVIS",
    description="Web service untuk TP PROVIS",
    version="0.0.1",)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class produk(BaseModel):
    id: str
    nama: str
    deskripsi: str
    kategori:str
    img:str
    harga:str
    rating:float
    penjualan:int

# Data dummy produk
produk_data = {"data":[
    {"id": "1", "nama": "Robinson Top-Zip Card Case (hz)", "deskripsi": "Logo detail leather, card holder, Cow leather, Lined interior, 10 card slots, 1 zip pocket,  Dimensions: L13cm x H7.5cm x W1.5cm","kategori":"Tas", "img":"../image/1.jpeg", "harga":"3.305.650", "rating": 4.5, "penjualan" : 3430},
    {"id": "2", "nama": "Kate Spade Leila Medium Compact Bifold Wallet Light Sand", "deskripsi": "Product size is measured based on sultanstore.id standard measurement method. It might be different from other source using different standard size measurement.Product color might slightly varied due to photographic lighting. Actual colors you see will depend on your monitor.All trademarks, brand names and logos mentioned are used for identification purposes only and are registered trademarks of their respective owners who reserve the rights of ownership.","kategori":"Tas", "img":"../image/2.jpeg", "harga":"7.064.100", "rating": 4.9, "penjualan" : 30},
    {"id": "3", "nama": "Burberry Short-Sleeve Viscose Cady Trench Dress Soft Fawn", "deskripsi": "A short-sleeved dress inspired by our signature trench, elevated in fluid viscose cady. Use the belt to cinch the silhouette at the waist.","kategori":"Baju", "img":"../image/3.jpeg", "harga":"16.500.000", "rating": 4.2, "penjualan" : 1230},
    {"id": "4", "nama": "Self Portrait Check Boucle Chiffon Midi Dress Black", "deskripsi": "It's hard to find a sophisticated outfit that requires close to no effort, but this wrap dress, cut from black check bouclé and chiffon, is an exception. Its bodice is cinched with a belt for a feminine silhouette, while a pleated midi skirt falls to a delicate hem. A true investment piece, the detachable function allows it to be worn separately as a jacket and skirt – an endlessly versatile option for your next work trip or city break","kategori":"Baju", "img":"../image/4.jpeg", "harga":"8.350.000", "rating": 4, "penjualan" : 190},
    {"id": "5", "nama": "Self Portrait Bow Embellished Knitted Cardigan Navy", "deskripsi": "Crafted from navy soft knit, this feminine cardigan is sure to elevate the everyday. Its neckline is framed by pearl embellished trim and an oversized bow design whilst diamanté buttons add further sparkle down the front. Style it for work with black tailored trousers and brogues, or wear it with the matching skirt and heels for dinner with the girls","kategori":"Baju", "img":"../image/5.jpeg", "harga":"10.230.000", "rating": 4.6, "penjualan" : 3780},
    {"id": "6", "nama": "Christian Dior Sauvage Man EDP - 60 ML (Parfum Pria)", "deskripsi": "Parfum Christian Dior Sauvage Man EDP diluncurkan pada tahun 2018. BPOM: NC14210600639","kategori":"Parfum", "img":"../image/6.jpeg", "harga":"2.150.000", "rating": 2.9, "penjualan" : 30},
    {"id": "7", "nama": "Stuhrling Original", "deskripsi": "Jam tangan analog dengan desain mesh strap untuk gaya urban chic","kategori":"Jam Tangan", "img":"../image/7.jpeg", "harga":"3.589.000", "rating": 4.7, "penjualan" : 3890},
    {"id": "8", "nama": "Gucci Dive Bee Embroidered Green and Red", "deskripsi": "Product size is measured based on sultanstore.id standard measurement method. It might be different from other source using different standard size measurement.Product color might slightly varied due to photographic lighting. Actual colors you see will depend on your monitor.All trademarks, brand names and logos mentioned are used for identification purposes only and are registered trademarks of their respective owners who reserve the rights of ownership.","kategori":"Jam Tangan", "img":"../image/8.jpeg", "harga":"24.750.000", "rating": 4.7, "penjualan" : 9430},
    {"id": "9", "nama": "Re-Nylon Bucket Hat (vc)", "deskripsi": "Product does not come with any warranty services in the event of wear and tear.","kategori":"Topi", "img":"../image/9.jpeg", "harga":"12.750.000", "rating": 4.5, "penjualan" : 3430},
    {"id": "10", "nama": "Burberry Logo Print Cotton Hoodie Black Men", "deskripsi": "A hoodie containing organic loop-back cotton, highlighted with a contrasting logo print.","kategori":"Baju", "img":"../image/10.jpeg", "harga":"13.305.650", "rating": 4, "penjualan" : 1430},
], "message":"success", "error":"false"}

@app.get("/")
async def root():
    return {"message": "Dokumentasi API: [url]:8000/docs"}

@app.get("/daftar_produk")
async def get_produk():
    return produk_data


@app.get("/detil_produk/{produk_id}", response_model=produk)
async def get_produk_detail(produk_id: str):
    for produk in produk_data["data"]:
        if produk["id"] == produk_id:
            return produk
    return {"message": "produk not found"}

path_img = "../image/"  
@app.get("/produk_image/{produk_id}")
async def read_image(produk_id: int):
    nama_image = f"{produk_id}.jpeg" 
    image_path = path.join(path_img + nama_image) 
    print(image_path)
    if not path.exists(image_path):
        raise HTTPException(status_code=404, detail="File dengan nama tersebut tidak ditemukan")
    
    return FileResponse(image_path)