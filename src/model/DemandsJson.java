package model;

import java.util.ArrayList;
import java.util.List;

public class DemandsJson {

    int status = 0;

    List<Demand> demandList = new ArrayList<>();


    public List<Demand> getDemandList() {
        return demandList;
    }

    public void setDemandList(List<Demand> demandList) {
        this.demandList = demandList;
    }
}
