# skyting-1090

This project repurposes an aluminum coffee tin into a high-performance, active-cooled Faraday cage and ground plane for an ADSB receiver.

![skyting-1090 diagram](skyting-1090-diagram.png)

---

## 🛠 Can Preparation

**Top (Solid Bottom) — Ground Plane**
- Drill a center hole in the solid metal base.
- Sand the interior and exterior to bare silver metal.
- Install the SMA Bulkhead.
- This serves as your 1090 MHz ground plane.

**Bottom (Lid) — Ventilation**
- Drill 1″ vent holes.
- Remove the plastic liner and sand the threads.

**RF Shielding**
- Screw the stainless steel mesh over the lid holes.
- Ensure it makes direct contact with the sanded lid metal to block 1 GHz noise.

---

## 📐 Internal Sled & Airflow

**The Baffle**
- Cut an acrylic sheet to fit the can's width.
- Ensure it is short enough to leave a 1″ gap at the top for air to "U-turn."

**Board Mounting**
- **Side A:** Mount the Orange Pi Zero 2W.
- **Side B:** Mount the SDR Stick (flipped 180° so the SMA port faces the top).

**Cooling**
- Mount the 5 V fan at the bottom of the baffle.
- Position it to blow outward through the mesh.

---

## 🔌 Connectivity

| Connection | Details |
|---|---|
| **RF Path** | Connect a 12″ coax from the top SMA bulkhead down to the SDR's SMA port. |
| **Data Path** | Use a short USB-C to USB-A pigtail to connect the SDR to the Pi. |
| **Power Path** | Run a USB-C cable through a side-panel grommet; plug it directly into the Pi. |
| **Fan Power** | Connect the fan's red/black wires to GPIO Pin 2 (5 V) and Pin 6 (GND). |
| **WiFi Antenna** | Route the 3″ stub antenna through the mesh lid so it hangs vertically. |

---

## ✅ Final Check

- **No Shorts:** Ensure no metal solder points touch the can walls (the acrylic baffle helps here).
- **Tight Seal:** Screw the lid on firmly to engage the "Faraday" thread contact.
- **Weatherproofing:** If mounting outdoors, add a drip-loop to the power cable and silicone the top SMA nut.

---

## 💡 Result

You now have a weather-resistant, thermally managed, and RF-shielded ADSB node ready for mounting.

---

## 🛒 Parts List

| Part | Link |
|---|---|
| 35mm Hydraulic Bearing Fan | [Amazon B07V35FR4Z](https://www.amazon.com/dp/B07V35FR4Z) |
| Orange Pi Zero 2W | [Amazon B0CHMGNY3W](https://www.amazon.com/dp/B0CHMGNY3W) |
| SDR+LNA+SAW: ADSBexchange.com Blue R820T2 RTL2832U, 0.5 PPM TCXO ADS-B SDR w/Amp and 1090 MHz Filter, Antenna, & Software on Industrial MicroSD | [ADSBexchange.com](https://store.adsbexchange.com/products/adsbexchange-com-r820t2-rtl2832u-0-5-ppm-tcxo-ads-b-sdr-w-amp-and-1090-mhz-filter-software-on-industrial-microsd) |
| Illy Coffee Can | — |
| AMZDEPOT 6 Pack 6×8 Inch Wire Mesh, 20 Mesh Stainless Steel | [Amazon B0C5X98VTD](https://www.amazon.com/dp/B0C5X98VTD) |
| exgoofit SMA Bulkhead Adapter Female Coupler 2-Pack Waterproof Panel Mount Connector for RF Coaxial Antennas | [Amazon B0D66Y7C6J](https://www.amazon.com/dp/B0D66Y7C6J) |
| Coax Jumpers | [Amazon B07MJQWH8S](https://www.amazon.com/dp/B07MJQWH8S) |
| Power Supply | [Amazon B07W8XHMJZ](https://www.amazon.com/dp/B07W8XHMJZ) |
| Display Cable (for setup) | [Amazon B0DFYFSJDM](https://www.amazon.com/dp/B0DFYFSJDM) |
