package model;

import java.util.ArrayList;
import java.util.List;

public class SuppliesJson {

    int status = 0;
    int supplierId = 0;//根据不同供应商，查询出的内容是不同的

    List<Supply> supplyList = new ArrayList<>();

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public List<Supply> getSupplyList() {
        return supplyList;
    }

    public void setSupplyList(List<Supply> supplyList) {
        this.supplyList = supplyList;
    }
}
