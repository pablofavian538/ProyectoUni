import { AfterViewInit, Component, OnInit } from '@angular/core';

import { EstudianteService } from 'src/app/services/estudiante.service';

import { ActivatedRoute } from '@angular/router';
import { LoadingController, ModalController } from '@ionic/angular';
import { FormBuilder } from '@angular/forms';
import { AsginarMateriaComponent } from 'src/app/components/asginar-materia/asginar-materia.component';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.page.html',
  styleUrls: ['./inicio.page.scss'],
})
export class InicioPage implements OnInit, AfterViewInit {
  isOpen: boolean = false;
  idUser: number = 0;
  idDecano?: number;
  estu?: string;
  idMalla: number = 0;
  rol!: string;
  admin: boolean = false;
  cantidadAsignacion?: number;

  constructor(
    private fb: FormBuilder,
    private _estudianteService: EstudianteService,
    private rutaActiva: ActivatedRoute,
    private loadingCtrl: LoadingController,
    private modalController: ModalController
  ) {}
  ngAfterViewInit(): void {}

  ngOnInit() {
    this._estudianteService.MateriasAsginadas.subscribe((resp) => {
      this.cantidadAsignacion = resp.length;
    });
  }
  ionViewWillEnter() {
    this.idUser = this.rutaActiva.snapshot.params['idUsuario'];
    this.rol = this.rutaActiva.snapshot.params['rol'];

    if (this.rol == 'Admin') {
      this.admin = true;
      this.getDecano(this.idUser);
    } else {
      this.getEstudiante(this.idUser);
    }
  }
  getEstudiante(id: number) {
    this._estudianteService.getEstudianteById(id).subscribe((resp) => {
      if (resp == null) {
        this.isOpen = true;
      } else {
        console.log(resp);
        this.estu = resp.nombre;
        this.idMalla = resp.idMalla;
      }
    });
  }
  getDecano(id: number) {
    this._estudianteService.getDecanoById(id).subscribe((resp) => {
      if (resp == null) {
        this.isOpen = true;
      } else {
        console.log(resp);
        this.estu = resp.nombre;
        this.idMalla = 0;
        this.idDecano = resp.idDecano;
      }
    });
  }

  abrirModal(): boolean {
    if (this.isOpen) {
      return true;
    }
    return false;
  }

  async abrirAsignacion() {
    const materia = await this.modalController.create({
      component: AsginarMateriaComponent,
      cssClass: 'contenido',
    });

    return await materia.present();
  }
}
