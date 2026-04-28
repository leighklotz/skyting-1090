# skyting-1090

This project repurposes an aluminum coffee tin into a high-performance, active-cooled Faraday cage and ground plane for an ADSB receiver.

![skyting-1090 diagram](https://raw.githubusercontent.com/leighklotz/skyting-1090/main/skyting-1090-diagram.png)

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
