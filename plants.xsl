<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Plant Database</title>
                <link rel="stylesheet" type="text/css" href="styles.css"/>
            </head>
            <body>
                <div class="container">
                    <div class="form-section">
                        <h3>Click on a plant to display its information or add a new one.</h3>
                        <label>Common</label>
                        <input type="text" id="common"/>

                        <label>Botanical</label>
                        <input type="text" id="botanical"/>

                        <label>Zone</label>
                        <input type="text" id="zone"/>

                        <label>Light</label>
                        <input type="text" id="light"/>

                        <label>Price</label>
                        <input type="text" id="price"/>

                        <label>Availability</label>
                        <input type="text" id="availability"/>

                        <div class="button-group">
                            <button class="add" onclick="addPlant()">Add</button>
                            <button class="save" onclick="savePlant()">Save</button>
                            <button class="delete" onclick="deletePlant()">Delete</button>
                            <button class="reset" onclick="resetFields()">Reset</button>
                        </div>
                    </div>

                    <table id="plantTable">
                        <tr>
                            <th>Common Name</th>
                            <th>Botanical Name</th>
                            <th>Zone</th>
                            <th>Light</th>
                            <th>Price</th>
                            <th>Availability</th>
                        </tr>
                        <xsl:for-each select="plants/plant">
                            <tr onclick="displayPlant(this)">
                                <td><xsl:value-of select="common"/></td>
                                <td><xsl:value-of select="botanical"/></td>
                                <td><xsl:value-of select="zone"/></td>
                                <td><xsl:value-of select="light"/></td>
                                <td><xsl:value-of select="price"/></td>
                                <td><xsl:value-of select="availability"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>

                <script>
                    let selectedRow = null;

                    function displayPlant(row) {
                        selectedRow = row;
                        document.getElementById("common").value = row.cells[0].innerText;
                        document.getElementById("botanical").value = row.cells[1].innerText;
                        document.getElementById("zone").value = row.cells[2].innerText;
                        document.getElementById("light").value = row.cells[3].innerText;
                        document.getElementById("price").value = row.cells[4].innerText;
                        document.getElementById("availability").value = row.cells[5].innerText;
                    }

                    function addPlant() {
                        let table = document.getElementById("plantTable");
                        let row = table.insertRow(-1);

                        let common = document.getElementById("common").value;
                        let botanical = document.getElementById("botanical").value;
                        let zone = document.getElementById("zone").value;
                        let light = document.getElementById("light").value;
                        let price = document.getElementById("price").value;
                        let availability = document.getElementById("availability").value;

                        row.insertCell(0).innerText = common;
                        row.insertCell(1).innerText = botanical;
                        row.insertCell(2).innerText = zone;
                        row.insertCell(3).innerText = light;
                        row.insertCell(4).innerText = price;
                        row.insertCell(5).innerText = availability;
                        row.onclick = function() { displayPlant(this); };
                    }

                    function savePlant() {
                        if (selectedRow) {
                            selectedRow.cells[0].innerText = document.getElementById("common").value;
                            selectedRow.cells[1].innerText = document.getElementById("botanical").value;
                            selectedRow.cells[2].innerText = document.getElementById("zone").value;
                            selectedRow.cells[3].innerText = document.getElementById("light").value;
                            selectedRow.cells[4].innerText = document.getElementById("price").value;
                            selectedRow.cells[5].innerText = document.getElementById("availability").value;
                        }
                    }

                    function deletePlant() {
                        if (selectedRow) {
                            selectedRow.remove();
                            resetFields();
                        }
                    }

                    function resetFields() {
                        document.getElementById("common").value = "";
                        document.getElementById("botanical").value = "";
                        document.getElementById("zone").value = "";
                        document.getElementById("light").value = "";
                        document.getElementById("price").value = "";
                        document.getElementById("availability").value = "";
                        selectedRow = null;
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
