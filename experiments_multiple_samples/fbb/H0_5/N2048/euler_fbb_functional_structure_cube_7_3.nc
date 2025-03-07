CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T104133        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.5</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?l���K#?�#Spw��?̚~;G�?�%���~?�>�9�9@ O0nC�_@Ʉ)6��@1vTݢ@s�[c��@C%����@"�&���3@'C��v�@,����@0��5r��@3rXJ�!h@6�`���@9�5G�@=a�_H��@@�����@B����]^@D��^�1@F�7ؽ&V@Iao�s`@K�0F?�4@N�9�m�@P�Tȧ�B@R�1���@S��^��@Ul���'@V�;�Α@X\"�_o@Z`w[7 @[�Gk�f@]�A���d@_�̑4�@`ͰCP��@aӬ�u��@b�x֌�D@c�#r�@@e��da^@fD�~c@gv\&Z�Q@h�c����@i�!���c@kA�R�C@l�q-��@m��ǯ�;@oY��7@pc��8�0@qF+�V@q�~�Tň@r��Î}@si���w�@t5�_J"@ut4Mk|@u�HL��-@v�s��	@w���r��@xs��)/M@yY|�O�1@zCm\�Ū@{1U����@|#��3        ??��>t ?���z�6?�Oԧ�q�?�JeR�2?�Z��`P�?Ԧæ�� ?�V3RS~}?��o���?�YPm�?�_��d�d?��vaද?�L�Nv��?��NT�*�@��0��@H�a���@
*k�s��@���9K@��Y��@��ֹQ@�T�z��@,�֮y�@f]��i@!��ӭ�@$��Ú@&�]���@)�1���@,�D~�lC@0P��@2U��`�R@4�u����@7�81G{@9�8�+@K@<����%@?�z�hy�@A��W��R@Cnv�Tv\@E^����@Gl;��G�@I������@K�fbEi@N9�U�^_@PYSP�/�@Q��
��@R�!",}@T\���@Uͫ���s@WM#��_3@X��L��X@Zz��Un�@\+\�Qv@]��>_"g@_�fܫ��@`��(DC.@a��o$�>@b�E��N@d���*�@e,��h5@fb�I�g@g�0ZI�@h�buM@jU����@k�Awi�;@mA�
Y�Q        ?��N�ԅ�?���*�	�?�˳�Á@_��;@;`�@!u1��"Z@*�Y�p�@2�Hf�N@8�w���W@?�q���@C���)�9@G�ʐ�T�@K�;�|�%@PM�!�Z@RǟL��@Uec�@X%w��At@[��J-@^	�4(@`�0:y�@b:�Ct�@c�\��@e�źMJ�@g�j�O��@i�䀳��@k��RP�@m�>�]@o�:���@q(��*�C@rdi�d�@s�ɋ�e�@u�ޭ*4@vxbs�n�@w�+ ^~m@y��Vl%�@{-���
n@|��V_�@~�3�U��@�L��h"x@�I�eG�@�R�n�"@�g8�@������@��H��0@��RS}�@�2G�Ԟ�@���
os�@��$�L�@�M"U@�����@�JB1�@�nv,iV{@�>��iT�@��z���@��L3>�*@����!��@�ƞ(w� @�����)@���JPK@���e@���qd(�@�ԘPP7@����&R        @\>�П@J�1���@oș���a@�+M�\6@��z�@���{��@�	�R!��@�%��_�@�-M�լ�@���L�@Ɓ`��b@�t��/�@@�xg$P�@�|��G@���Bg@�\�����@�:$M�d@�0lj�,@�f�<b�@����F�@�?�*?��@��p���@��$?7)L@�F���E�@��ŋtN�@�a�D8N@�L��b!@�����[@��m��@�_����@�IRʿ7@�C��U!�A 'k�G�A5��5	�AL��[Al\䎮�A�����A�7��<�A BP
B�AB�G��pA	���m�A
�M8�:A<��~��A�~���#A	���A=��2�A���[�wA�ѐɇVA{o�>A@[ ��Ad�iA�"���jA�~��v�Apg�ԲAB�q��A�}���A����A�d���?A�-"J�A�.0��Ab"2[�AD�1TDA(��T�        ?0�c�W?t���;x?�ʎќQt?��D'�C?�L�:+]�?���%T�?ݯ�Ci�d?�u���OS?�C��aL�?��K\�?�,���:�?�͓�E��@$�^�@fH6f�1@	:�Y�@%�W@�� ��|@��3�U�@y*��j@��rQ@�}� �@���{c@ �O�}@"C����p@$u:��@%�nM��@'���q�P@)�G��@+�i���i@.��d��@0�P�8Z@1<O����@2a۸F|�@3����?�@4�&��s�@6�4��6@7b��DI@8×!���@:2�_Ί�@;�4����@=<UR�b@>�-���@@@tJ���@A�@�@B<��:@B��u/�@C���@D�� �L@E�۳@F�k��@H*\N�@I3"2�*�@J^`)��@K�tB�@L�fRE��@N0���@Of�r'��@P`s�x�[@Q���@Qɡ��o�@R���B0�@SF�"�g@T0�J|        ?"��z�z�?iE�:��L?������?��,{�U�?��7���?�oح�gc?�V����?��xN;�?ލUPj?��UhA?�F��?��@��?�����?�킯�u�?��,/�޸?���d��2@ �V�iT@d�*�@��q��@	/��Fa�@܄Q���@����3.@��⓺�@��|��@�I�-K@�2�Z�
@�_V�G:@"
ǔiz�@$r^�*��@'!�H�~F@*����@-l�y�~@0�AW�@2�.u�@4����M�@7�����@9�~�g-@<F鱫{�@?$�\�@A��~�@B�'ځ�@Dd�5XW@F.�Cf@HHÜ�S@J����@L1��Jk@NJ���*�@PGlﶺ�@Qud��}@R����e@S�2���w@UDb�@V�I׶�@X�r���@Ys��at*@Z��Y}�@\o�
�<_@]��n�Iw@_���`�@`�����@ak�]a`@bDʤx@c!�D
9
        >�s�1Li?7�J:�9?]���g�?uB�cAt?�x1k��W?��e}nLJ?�E�~,?��:ت�?����[��?�A�p�w?�����%?�%��#�?�=Z���?�}��r)�?ґ�����?�:?�e�?���OC��?��:��c??�ꀰ�n�?��Q��A?�>~E��W?�en8f?��*W/+?���Y@ �L�+M@���Y�@��6�@
���l/@W�hlP@!?Vp�@��)\� @�B�ԭ�@R��у@@`��@!�S�^	D@#۸-f��@&V�@)
�B��@+��#�-�@/1����@1U����f@36���ۋ@5>�X���@7n�]�M@9�!��,@<P-R��@?��� �@@�#�ę�@B��h��@D*�ԣ@E��R�@G�U�m<�@IɔN?�C@K�G�@N!��zv'@P?[~�@Q~��'m@R�QX�@9@T3�އZ@U���@W4��jR<@X���C��@Z���f        ?ƖF���"@?Ŋ��@3�0f�8@L����F@^I�RG�@juo��!�@trS/E�@}����@��� �<n@�<���S@��d�)�x@�4�h���@��Z�ה�@���
��@�T?���@@���fA��@�qoO@7@�N�b�@�ђL��@��ŨXz�@��?_�]�@��FQM'@�83�_�@����@u�@��n�G�@����L`@��P��$A@��xn���@���لC@�^@H��@�_��j��@�`�{"�@�bI�']�@�g&�l�_@�r����@ƅ�b̯U@ǣ��|kp@���ݺ!@�>��B@�F�$�@̖#YE@���xG�@�YڬM4�@�gR�bS@�(?���0@���(�@Ҿ��r�@ӕ"�� �@�rЯ��V@�W�%�@�C�Akn@�7ӠI:@�1 ��� @�1��xn@�9���0
@�H�1N@�^��s@�|�|2��@ޡ��B��@��g���6@��Hv0�Q@�
�@����>(        ?a��D��?�S\�Df�?ĳ�	���?�h1����?��{��ğ?���rh{@����@
�h�`�*@�ڑ��@ <y��	@��ؓ��@!��ˢ�@%��)�@(�{AD�@-$\�"��@0ԗ.��s@3CJ��v�@5����@8�^�M'@;���0�@>��Y��
@A�Qc9L@B�AW	@D��=��@F���`�@H�G�C'@J�AP���@M"�$ �{@O���j�@P�#�L��@RJ�$I��@S�!�7V@U�5v��@V�����@X@�/`�@Y��b^�@[D��|�(@\��Uw �@^�"��V�@`F\�k*k@a6����D@b.4hC�@c-%e�w�@d3]��*@e@�vc�N@fU�E@gq���@L@h����>�@i��P�	&@j�ǐ=WF@l+k��^@ml~Z5�e@n��2�A@pQ�Of�@p��Z`,�@q\�ͽ`n@r�e��@r��֮k@s}���X@t:9��� @t��Ҽ��@u�Q˾nw@v��溓�        ?K�ܗ��V?�D����?�cz-
�<?�F�l
�?ܥ����?�-dQx.�?�-�?x��?�M�Ʃ�:@ �c{@��@2�*�@
'�W���@��J[�L@���X6@�D��>@h'��m�@*g^p��@ ����<�@"�mw�P�@%:3��0@'Ծҍ�@*�}.�P�@-��ϒa@0��QDp@2cH��"A@4dSIg�@6���`��@8���! -@;����@>e�6�@@��8|i6@Bg��b�@D5�Akb4@F(��;��@HA9�oD<@J�pk;:q@L�{���A@O}��(0�@Q�F��@R�>&�@T1۵=@U�L��%�@W}�6��@YO�g�0l@[;|�D�@]@I۳�&@_^���ր@`�*�[�@a�����T@c/9XY@dv���k@e̓�+@�@g4Y��VI@h���pYS@j4Lh�@k�$0t-@m|c�W@o<�6rk�@p���D�@q|����@r{Lb8T@s�G��E@t����P@u���R        ?p�B�|�;?��,v ?Я
aZ�?���c�Ɔ?�+Įs�@�v�@҅�I�@�Dl`�@�8w-�@!� R�@%�#��j@*v1��,@/c!�^��@2V]��H@5)-'�_Y@8+�F��`@;`a��@>��UM6�@A4I�w�@C!�j�|@E. ����@G[���e@I��Pr�@L"����@N�\����@P����7@R9T��O�@S�F���@Ui�����@W$j�Ϲ�@X�S3%ۈ@Z�X6p��@\�n=��@_
���@`��=]9@aй�o�@cdI�S@dW�h�@e���ق�@gC60�@h�%t�@j��6�@@k��� �@m^EYe�@o�r�w@pr���6}@qb
���@r[�>Q@s^4O��@tke���@u�j�<��@v�oY�3@w��w��@y�.kw�@zT?c�
@{���	!@}5���@~p���\�@�S��s@���2�-�@����c@�S�Iq�F@�,��%"!        @�}��C@A�
����@e$���@|����+"@�����&�@�r�I��@�o6}
x@��8��n�@�����@��X��{�@��9H�[@�M��k��@�_!��.�@ƭ��76�@�;F����@����@�
��ǲ�@�2�$ȝ@�z��h�@���Pn�@�p�j$�@��DX3�@��i�V�@�r�*���@��4*�-�@��7�Q�@�Nݧ��@�;�E�@���m12@�Н�O��@����=?'@��c�U��@���=Z@��a��@�= bl�2@�k)�b��@��"��@���<&4@�/�a��E@���c?y@���+�6@�F�a2-�@��s�9@�,Zr�JA U���kOAFE���A�ʜ�ȖA�8�Ft�A{�f&�AN��IǡA%{�{S�A���q?�A�cdY�A�s	��WA�*�:��A	��D�3A
v�1c�tAd��߃�AU&�4_�AHO0:LA>���5A60bB��A\�|r7        ?1�Yb~��?r��R^�?�NP9�u�?����t;
?����F�?Ћċ߫_?�ھS�'?�=\F'?�gJ�/+?�p��s�?���^�?�'�XϡH?���d높@:84E@x�_7�@
:)�jG@L�&T@X��[�@�)h�##@9��h&S@�l���@�ND{�S@ʱM��@ �a��/�@"�0�d#@$q���??@&K1#J�@(9�a�@*<�Hͅ@,S,0�J�@.}6�,.@0\����.@1����
@2����@3�Nȃ�@5-�w���@6v�m���@7���8��@9 �%$��@:��*�i�@;�'�F@=S���P@>�?Jz�`@@G�?��@@�V��F@A�a�C�@Be�0oIC@C-�'�ݗ@C���nN@D�Tʘ�@E��| W�@Fs�烙Q@GOHϯ%@H/.����@I��*�@I�1O�7@J�^�-�@K߆��!�@L�ƫ��@Mףב3@N�FR��+@O�Ѐz�P@P{�m��        ?��w,
T?e��]�#?��㭚D?���:�;�?��iQ��N?¥L�[�J?̕'=Ԑ�?�=��0�?�)q�/�?ሄ��
?� �J�?�y%+8�?�R]��p?�t�lg��?��h�o�?��4�;�?��z���@� a�ǿ@���q�@uv
 �@
���H�@$�Q�x�@��G=>@��Z�)@[���v @Ֆ):@�#�f�(@j��Zm@ E�7�@!����9@#��!p@%���P@'�f��@*A����@,��<u�W@/�=v��@0���j@@2r�7H�M@4R�!>@5ėH�@7�m$�%@9�K�<�@;�f�{#�@=�g�]�B@@(�SgE�@Ap|Ա�p@B�2�@DB���ַ@E��@�_@Gv�ӹ�@I7���܉@Kl� Z@M2�QR#@O)��*�@P��]�@Q�.u��@Sc0�5�@TpɃ�c@U�3��@WN�lԻ@Xݤ{ �[@Z�5t��@\@3Xm        ?�c�O�?G�/�4�2?l���"h�?�Y\�,?��	pK��?�>E�Mq�?���G�?��Pn$�?����՗?�� �?͉��l2�?�oT�K�]?�-����D?�'(Ʉ?�?o�p�?�-�/��?��nc[�w?�Ȧ�Z�?�����?���^�Y.?��D�n�>@w��\��@d��!LU@�qE��@.�x=@��Wʹ@��'0@[��� @�|f� @�_�Q�@� �b^�@����\�@!��U\��@#���J��@%��@9OW@(���!@*�@��@-F�Z�wF@0��x��@1�/���@3n��Ht}@5L9�<9@7O&^���@9z�|ѥ@;����[x@>P!_kF�@@���@A�\�f�d@Cw�JF�@E3Z��@F�,V�K@H�����@J�?�h@L���	�@N�
�L�!@P���E@Q׶%��{@S"���]@TT~�4t@U�w��^+@Wp�f���@YY�x�@Z�6G�        ?���Xj��@$���;B@*E!"��@C����@T4�s�@a|���@j����ai@s:�M0�@y�ۃ�@��,�S�@��.^��@���}�q@�f!�@�lo��@����@��"��Mz@�s���,@�!�nzuf@�&�I�x@�I��v�G@��%��@��;��@�e	)�@��4��(f@�[T�P2�@��`J�,@�=V�+�&@����'@�U/[�%�@���J�@���̀�@�Ub:�B�@���w��@��c�@S�@�]<��Z{@�N�D�@�C���@�>�C�P@�>�	��@�A�tm��@�I��5s�@�T��P&@�c�>@�u��!�@ʋ:�W@ˤM��%�@��>'F�@��X�8a@���lu@�/��.�@бsB�0@�K��@G�@��Q�!�@Ҋ:��+�@�.��dc@�֔��4�@Ԃ_%��n@�2b� @�����@֝ߞ���@�Z"J*Y@���M)&@���M�d�        ?��{�&?���BQQ�?�fv�@��@ �;���:@��vp^E@PXX���@!��WT~@(+��G 2@/�!uV�@4 L?y'j@8���p߈@=��E��@A�d���@D���p�@G�|���@K���@N�y�1��@Q*j�ᣡ@Sr�@U)\jc��@WJ��i��@Y��p���@[��Y��@^/��/�@`R`;��@a�d�zq@b��o@d@sj[@e���=�@g�u�Ǜ@h�m�O�@jtvHqc@k�U:W@m3qڊ�\@nֶ��@pB���pS@qp�{%+@r,�'�G@r��GI�@s���@@t�?��ES@u�"���@v͢�|g�@w��f��e@x�o��y@y����5�@{HǄf�@|<ln��@@}f�0�@~�N>X}K@�+9t�@��^9�Y�@�'��{�@��#6��@�v5�`@�"�5�E@���|
@�������@�>�(T��@��M2Pn@���ã��@�}����@�E���`        ??K�U[/�?�P70R�?��z:��?��7��.R?̚ոĕ�?ؠ�B�?���Voy�?���U�ױ?�.���	3?��J4�9?���[<�@6aT@�Y-�k@
Z�S�@��E���@�q��@}mԵ��@o#I�V?@��|�<@��\];@ �z�:ܨ@"��"/3U@%:c0� @'��FY@*G!�;��@-"��ҞF@07����@1ϑY��@3��V�^@5�YE�9@7υ!j^&@:*�\u��@<�hk�h@?�~p�'@AC�\��E@B潘;��@D�Q��0@F�SKd��@H�x3��t@J�J)�bW@M?,Y$�
@O�l�� @Q@�8P�}@R����=@T<�@UݼO���@W���n��@Ym�uiſ@[^�^��@]j�T��@_���[@`��3�:@b#9ٌ��@ch=���@d���@�@f&�O/@g�סI@i0����@j��0�)@l�f�@nW��o�@p��y�@q2��DH        ?Zl]:se�?���l#��?�e�֯b?ȝ��i�?�	�N{�?���H:?�?���_?���Vi*?��]=~��@�ƺa{@	<��S�@�\�Sv@��<�'@`���w@��G�@!��J~��@%�Q��*@)��پ��@.v�+j>C@1�J0ΰ@4�$�(eM@8ZI+��@<&��+�@@/��#@B�-2CZ@E�渑@G�I F@J�+wA�v@NMvX�@P�nB#�@R�L�pZ.@T�q_� @W:���@Y����%]@\-�Cd)@^�V�@`��O�@bkR�Cn2@d	�T�Z@e��Mt�f@g���He`@iwz�ql�@kz�m�]�@m�T6v�k@o����?@q�Z�@rV}c��w@s�e�M��@u[�J��@vs����@w���J-@y���Z
�@{4*ڸ�@|��KXDW@~���H�@�Q��z�s@�NJ��@�Ur%N�+@�g���V@����^v�@������@����Fz�@�$7<��        @���CD@PRW,�
A@oџ���@�o��Z�@��t����@�]�"���@��O���@�c��hJ@��st��@���/]4�@��;Jx�q@�{�B��2@Ĺo	�D1@�6v\Jf@��·}��@��si��~@��2s�@�G��m�@֝sSQ�@�!�j@@۟�&��@@�L_�_s@����}�T@��(���@����9�@��˴�@���@�^��$y(@�����@���ER�@��k��5@ﶜ�]�6@�ڸoU�@��)��@��Kw�@�J�F�@�.t�d�}@�Y�祅N@����i@��3��q�@��Ǜ�@�i;1�L@��a�ͼ�@�0���@�������A ����AYY����A%�����A���ь�AѶ�8&A�q�F�pA��-1$�A�*��,WAyx�aέAt�Dh�A	w����A
�t��NcA��2�c2A������Aү_<WA��)��A��g`|A��o<�        ?~����K!?��L%q?���Y]6?�Dh}3[�?���h.?�6nPx�@�7�O��@�#�C�@.��;\~@�/�r@5���@!if�e�Z@$h�?b@'�Џ�@*�ٹ�#@.t:�a<Q@1��@2��E`�@5 ���;@7K!�\:@9>K��0@;zܑ�~@=�߷V�S@@)�K):@AR�<7b�@B����@C�K��(@E@����/@F�J" �Q@H3�lN�@I�{4j�@K$�+?�@L�)���c@N1w�x٥@O��JJ�I@P�>~��@Q��F�@Ry�#�5y@S^ ʏC@TGf�x@U5`�m�@V'�K_��@WMe��@XaqO@Y�~H��@ZF�XO�@[$`) Zr@\/ I��z@]=���@^NR�[�@_b�_3:�@`=O�O��@`�ڵe��@aZ�(^w@a�8YM#m@b~B��c�@c`8s�/@c����@dDb(>B@d��%x@e#O"w�@f X�mD�@f�2�G�U        ?qt��?H1��-	?m�E�c||?�BA�mH?�P9k�a?�st p.?�� c��?�NyYnc�?��Ř\�?�Z�����?�-B�*?ä%�^�?Ƕ�
=��?̐@d��	?�0�b��?ԯן-AF?�����N�?���!�|?��ը7�?�{��ߗ?饁�E-??��� �?��.���?�cY�/�?�0����5?��޿rZu@K.�6�?@*|R�2�@qH1>�@+q}Dӧ@e�\ �,@�f5��@���e��@ж5�+�@6W�O1@K��*D@!���R�@#��Պ!�@&��K���@)t���@,��)�@0 ׺��@1�{����@4R]nbJ@6]|�'uE@8����D�@;�׳M@>�.�>�@@��6b�@B��G��]@Di?9�E@Ff�~��@H�T{��@J�ya�2�@MJ?f�.�@OꚳM�+@Q\AN�h@R���d@TroSU�@V#��5h�@W��![�@Y�m�7!�@[��        ?V�Oƈq?�4F'&}�?��(�ɟ�?�"f{~�?�̨�p��?��_��j?��e$ѽ?���%[o@�:�~VU@�ǸbZ$@t�l/"@f�t�Ɠ@no�e6@�Y��xp@ FH����@"��f\�@%�*� �@(r���l�@+�?���@.��@@1%��d�~@2�a�!m@4�"T��a@6�~ɝ�_@9P:.�@;]���_@=��N+�@@��/��@Ao,��s@Bу�k]@DG�W@E�{���@Grq�f�@I+�X]�y@J��sR�x@L�「��@N���z��@P��?Tb@Q�L�.u;@R��s��`@TGN*�@U��)]Ea@W�T���@X�r�?@ZE���E@[����P�@]�"O�')@_��ܘ�)@`�'i.N�@a�?k��@b��u�@dd4G~L@eG���@f��}b�Q@g��Q�@i*8��@j�b_nq @l�Jc�E@m�? �@o�f\�i@paBƤ�@q:Љ�i=@r
!%%        @Y4d>m�@:Q���e@Y��uL�@oj`�_�@}��X�@���Z���@�r�O��@��VG� �@�ɠ��}@�}X���-@���t�{@���aT�M@��6<n�@��OE���@�_~춐0@�hS��@��z��q�@����f��@���λ�@Ø�`�s@ņ)=(@ǈ}|_��@ɟ�4z��@�̀��\�@�]	}��@�2� �H@�ib���h@Ҫ�*�@��q�D��@�O$���@ֲ6��N@� �<'@ٙO���}@��ʌ)4@ܭ���@�G^M�K@��m �՜@���̅@� �z�)@�ig/]�@�t��8�,@�a�䢪�@�Sj� @�J~�M?�@�F���M�@�H�G�@�N?��"@�YL?K�I@�i����@�}R��~@�H��-@��RH�@��]�?C9@�|���~�@���JP@���~�@�B\F���@���m@�|9�dX�@���Px�@���EnT@�e�j��@�]�8�f        ?z���QZ�?����?ֲ�i8Y?�<�x��?�]VW��@H2/���@3���
�@��㼶�@-}�}3@#�.랔	@(A}�0�}@-L���@1j�GN� @4q(��q@7��	qB\@;T#�ڿ�@?7�[�Z�@A��Z��&@C��B6K@Fb�!��2@H���$|@K�N�*�@N���w�@PɌ�Y�_@R]��T�@Tg�&@U�C� )�@W�����3@Yd�f�-@[Y���V@]f�3V�f@_�F.��@`�;�D�@b@M��@c_�� I@d�g�>�@f�����@g��p�A@i(���)@j�P�ES�@l��zJ�@nR3���@p�-%�@q���z�@r?�G��@s'==��@t>d67�:@u^q��It@v�(�'��@w�SE�7�@x�hn�@z3:���o@{|����@|ͭ����@~&I��{@�<W�{@�v��z�	@�-��K8@����oS@���P�� @�f�d���@�*�҂b�@��.y|        ?j����?��W�Æ?֡���?� i{�ʑ@ ��-�9g@���P�@�{@^��ص@%�=w?~@+%��s@0�fE$�@4�bw�@8��i
m@<�����@@�x�(�@C8ބ<�@Eԑ*�@H�7�1�@K����o�@N��=4F@P�N�@R���WW�@Tq�V*��@VV
�Ž#@XRPϭU@Zf;F���@\�N���d@^���#R@`����@aۥȏ�R@c'����@d��d�9z@e����q@ggL��W@h��Iu��@j���-�@lB�/�Ι@n
<�#\@o鷦�6{@p�"���@q�����@si���@t>v)1!�@uw�m�-�@v¼���@xS��r�@y�M���.@{0�<-@|�!��X@~M��d��@����@��['�C@��ҹ�@�ܒ�v_@��Q�1@��HD(5G@�nu�<@@�8@$�@�i׽�y�@��LW/��@�����h�@�@�4��@��p^���        ?W��J��?��g�8b?�,!����?��=��a?�ܸ�#��?�t1�1q?�����F?�8I����@$\&3�@	�DŊk�@$)Ǹǡ@���'�3@����n�@)�e�.�@ ���3x+@#1MZ� �@&��)�@);v/\�@,�"	�{@0���َ@2VqDI�@4	�I�@60,����@8vh��@:�-V̬�@=i���6�@@�b�{�@A{s�;w)@C �m f�@D��ݳ@F]���ھ@H=~(�@JC�d5N@Lsw���@N�^T�f@P��?7�@R� ���@S�{'��@U1��]-�@V횺J�@X�s��}@Z�#<�8@\��b�0@_%�T�rE@`�\��l@b
M ��|@cbR�7��@d�ǱU@fNbL�p�@g����,@i�}�PT?@kQ�qU<@m+��M�@o�4zG@p���VI�@q��J��@r���_��@s�I�AR@u, ʍ-0@vsD@?}�@w�A���@y++�@z�:��;        @�S�l3�@S�!�@@v�~��$�@�"9�I!�@��$@*�w@��W�<Y@�VJ#�?�@�aPu�@���
Δ�@�&�{2�@���XL@�c�QJ|�@ҕ�Q�g�@ղz����@���m�@ܙ�'�=�@�2ӳ>@�6���/*@�W��{��@敬�=�@��s�o�@�d1�h��@�򚢕��@�L��<�@�P"V@�T��M@��5c�@�� S�@��iX�P@�H��[@��p��{�@��� U�@���X�8�A ?��ĖAA b�+�AN
,|�Agmͺ�A��C^�A�0��^Ag�yAQ�����A	��{�MvA$��msA�Z8���AD�B�A���eA�+_U�A�7��A]L
FAAcx0A+���M�A#ю�mA��+�A	��?�AS�#�AeJ�f�A'$���A:v��BAS=�j��Aq\�e/cA�����A�5��
VA u`���        ?{���o& ?����"l?ߔ+��ف?�x\z2!�@��8!�N@���@
� h#�@"���]+@(�g��?@/[DrN�@3W!=3�
@7T�Ֆq�@;�P���@@!�Ru��@B��=%� @E2��C��@G�|�^�1@J���`n@M�9ɦI"@P��P��@R(�{�L@S�}� E@U�����x@W���Q:�@YqT3��r@[o����@]~��	@_���U@`�_*���@b ��@@c �B�r@dE~b��@em΃4�@f� q���@g�"3=�@h�?{ik�@j)};�@k]�6Y�@l��7}}7@m�8�T�@o���v�@p ��@p��e���@q^P~X�Z@q��b��@r��G@sD�4P@s藔I
@t��&�K�@u6�}s�@u�4v��g@v�����@w6�aD�@w���CT@x�-8�ų@yGB]���@y�*�
�>@z��1'~@{h+��~(@|!=���@|ۏ1�b@}����<[@~T��7�        ?�FX��0;?���?�?�J-�8�@G� �@����-@&�VO:�@/���\k @4�C��zw@9��	��{@>�I�:tg@B)Ӧ��@D������@G��.z	"@J����L�@M�e_!.�@PZ:�-�a@Q��^�@S�#�@U<Z�Lԝ@V����@X���Cf@Z���o@\b	�^��@^Q�
�8@`)rGcMq@a4��@��@bK+I�F�@cm��@d� ሟW@e�h7A{]@g'����@h�C|��9@i�t��0@kv�y{@mVbR�@n��,�5@p@x�.C@q/b�τ@r,�^H@s7��@tP��C;�@uz�q��@v�&�W��@x �v��@y]���@z��)�@|Nl�yiV@}�<k���@�pKZ�k@��~p6d@���DP�@�t�8[�@�lF#@�m>j���@�wm���@��ˍә�@��C�_��@�̴��e�@�����e�@�1�P�z@�qI���m@��2]}e�@�	�x:U�        ?q�l7���?�Ѫ�LG�?Ǯ4�H��?�45�x#?�P�t�?�#+f�@��.P�@�̰���@:[m��6@�^�j�@X�k�@��(a�@"�q�@@%-x+���@(v"�A��@+�N�ъ�@/��t�;|@1�"�{*�@3�!��R@6A�!�@8����و@;3�a�@=�^%�O@@`���d�@A��̾�~@C���Io@E<C�Kh=@GpR|��@I4|�$�@K�"����@N?�is@P��E��@R`j��@TO���@Vu�B�U@X��XYi_@[p�F_M�@^G���@`��M�@bV�gC @dl�VX=@f�Z�@h��6� @j:Bc�� @l�T���@n��K@�@p�)��m@r���=-@s��⤄�@u�dma@v�7�B�@x],8	��@z(�9�}K@|3�	�@~��`��@�<��5J@�:�~lV@�k�Ujw�@���}h�@� ���t@�c��1��@��:��\@�]�9�6        @&/�(^�c@g�e��{�@�1��û@���F��@�C�.�v{@�����@�h��. �@��Cxx�!@�w�ԩ�@��i$�@۝�*��G@�T��	�c@� �,/�@��_���@��M�d؟@��J_%�@�J�6�@�-@���Y@���T3�@��@V��@���R @�iV �Zd@�]����5@�`�c�D$@�r��1�A H�wj�A_t��A{�ivrA��;G��A���Ԡ�A���fA)ra�A@:�*aA	k�y
Z�A
�8�W3�A�8���A�f�X�A����5AA�nk6�A5��d��A�U��cNA^ʲ@A�)��_�A�����A�j�rA���O[�AEˋ�\uA�o�^�]Aq�H�joA�)9��A���A:5S*��A�>`'�eAo2�3� A.�A���n+lAE(�Q]�A�_��"5A�I�ƑA!��4��A����g�Ab����A�)
�        ?]�(�<v�?��0V�H#?��/Τ.�?�{�҃E?���p8?�]}�¬�?�gy@��?���IC	@�d1x�@;J��+@K�Pg�@f�#�S@aW�@�qЍDT@t8���@�>��l�@ �����@"҇��s@$�)����@'<-�$�h@)���3.j@,�̧�@.�~��E=@0��3��@2 )����@3l+Gf��@4�|�|}.@6ipQB@7��^�R@9�ȳm��@;?��o�@<�E�_d@>�Az�@@A�^H�@A.\�=�@B !����@C���g@D4����@E�ㆅ�@F =��J@G-�l���@HA7@C@@IY�-�y@Jx�b�@K�
���J@L��%MIo@M��j�/@O+�b�-�@P3�f�4�@P�[o[��@Qz!�~�U@R"M�MG@R��gx �@S}l��@T/�ѫ�@T��K��@U�����@V]+h1Q{@WO�Ae�@W�&�TR-@X����mI@Yw��Ģ�@ZG��X�W        ?	����?X���?~�;�q-?���<�B�?�����W?�ju��?�!���?ǥ2����?�o�b� V?��bOQ��?܏���?�$TӶx?楍�U��?���Ml��?���I>��?�|A�^�?���h�D�?�0��g��@B�MNQ�@L|��<@����@�,z��@�+��w@~6N�Uz@Bڈ6EH@Z�R+�@��Rbp@��	�@!��F��b@$M�;Qt@&��t�@)�K�@,� ��@00�X��@2j�T�@4'|\��@6j�q��@8�õf��@;�<#�J@>y�o3��@@�I�ɯ@B����]@Df?-���@FjM�-�O@H���i"@J�1l��@M�~���@P��w��@Q��/��@S3E��@T�ʑd*@V�\�c+�@X����4v@Z���� �@]'��R@_�.Q	�@a��i�@b�JB]4@c�q����@e��09@gC�~���@iDR�@j�!��Eu        ?R#U�D?���8׊?�׹`�R�?�PۢW�?�1F�?ޘ�N��?�/�D;��?�n���)�?�@|I�E ?�$=;A[�@�Ld�� @8G4��@|�ƞX@4c���@�s*��@*r��@/�T�.1@ J~�6P@"�	4V�@%B����G@(�,��e@*�C��H@.!`�Q�}@0��v�1�@2x���@4MV�[�@67Ry�U@86B(���@:I�G��@<r�WJu@>�k�ۆ@@�0W��e@A��pWy@B�׋r��@DL'+*@E��My�>@G!4��a@H���a;@JE�B�@K��i0N�@M��z�:�@O��Y�r�@P΀��@Q�s,���@R����@TS���@U?,]fvG@V}TE/�@W�[��b@Y$�w�(@Z��os��@\
7�p��@]�O�@_1@35"@`o=��H@aN����@b7DAj �@c)a>�J@d$d	+r�@e)]�q�Z@f8;��]8@gQ>�+�@ht�R[��        ?�F= f�@"hv�N@D8o�&��@Z]YUia�@ǐpk��@uAR�^��@V�!��@�iƊ�@��$R���@�F��JW�@��w��^?@��{��8@�݄7� 6@�����(�@��\(Խ�@�=D.'�9@�����@�W{q�Ɓ@���g@��s+�I�@�h�ޚ��@���Z�p�@��� ��J@�!�i�,!@��g��lT@��*YyR@�W�� eO@�0���@��*:I@���Y���@��>?���@�*�x�@ßy�hX
@Ķ#i���@�ӻ�dV@��*�^@�#Uq.�v@�U �*�
@ʍz��p@��e�i@��*���@�^q�cz@ϲ{���@І���Y!@�8,:oI@���"eWj@ҧ���^F@�fZ���:@�)�!z@��#���I@տ��!j@֒�n�P@�i�ȷch@�F}>�q_@�(Rv�J�@�2���M@��A�
@���F��@�ᴎ� =@��lT^[8@���"u�@���+/�@�u�^�        ?I9P.#qX?��὆�t?�4�����?�
�I�|?�KK�HK?ݓi�&?��`<ZT?����^s?����͑?�5�3�V@�}��5^@�0��m@
I��S_@-��5�@>h.�@����@/Y?�͗@y�y#�@���#@!Yy��E�@#Qc0��@%e2�QGw@'����@)�>��I@,J�Qu�@.��y�K/@0�pN���@2�ؕ�@3�r��=�@5J����@6�� A@@84�а՟@9�z�9~@;�!^�[�@=p?���@?P�3.@@�<��@A���QF�@B��@Fd@C�t���@D�k:m�@F�D��@G3�O���@Hl���a�@I�c�j�@J�v�p�@LM��a��@M�5��4�@O���U�@P@����@P��H�5N@Q��8�}K@R�8.A��@SPjE5$@T �@6�@T�=���!@U�@cpV�@V���[�@W���dp@X�y_���@Yx�Nrq�@Zrb�>%�@[r�3:A�        ? 9U�/r�?d8M�SoT?���pݾ?�+�Ư?�lb�~�]?�n��t}?�Z�"?��mj�?�47�,w�?蔱ʜ�C?�(�T��?�����5h?��w��n�?���o�S9@�`�5Pu@�C2��@Z')�@�Nܪ�@�j��*�@gr��kZ@U�?�@��^hL@"^`{!A�@%&|^h�@(@�K�@+�l��F�@/�����u@1�k��I@43��	g@6��5\��@9����~�@<�*��@?��G�`�@A�]e�@C����@E�N7�*@HF���n@J�4��}�@M�4 J�*@P7Vz�%@Qɻ�#��@Sy���X@UH��[K@W8�D"߃@YJ��Lk|@[�w%.'@]۟)I^�@`.�\5@a�As!�Y@b�X%o@dob)<@f Ȼ�@g��V H@i{U"���@k[�#��@mT���3@oiC�(�u@p��FW��@q���@s)9�;
�@tn����@u�'�� @w*��^k{        ?."`���?e�Ǜ��?���� g?�i����?����[?��v�ڤ?��6O���?Ȧ�e���?�u:�'�?�F� �q�?��>�v�?�-*���?�]ߊ��?蟫�'�?�81N?�T5��?��D-~�?�G�J�q?�S�Y{P�@ o�'@�(,J�@�c��E@�K�c�|@�	�v@5_"��@]�>�7!@�7Yd��@aT;WU�@F�GWŠ@ux��*+@ zÊ�@"dG��@$|�: @&�M�F��@)D�0�@@+���q�l@.����@1�,�Qi@2�L~-&@4�^�惠@6����'�@8�XG��@;;�s�@=���yݣ@@�hXc9@A��%(�@C�B���@D�����@FZx����@H.��co@J �F\�@L2�A�@Nc�{ͻ\@P[��P1>@Q���W�@R�߻�5@TEG!�0@U��� E�@WB��Ö�@X��1�@Z�l�&�@\a�+ֶ@^D҄Ȱ        ?���q�@i�v�m(@9������@Q�D5s��@b����L�@p�����@x��V�-�@��dc�Ŵ@��OWJ�@���B�@�hˍ�@@�Ҧ���a@��5Ei��@���+�@���x4�!@��hgyw�@�*-A�K�@��^��^@���y��@�����s@���N�y?@�ܯ���@�#���@���w�h@@�u����@�N]g�@����hї@�b&�r~@Ċr�'��@�w�:�p@ǧ��A"^@�M�P�7.@����T�@��*��@ΡPBp�@�D�O�@�A���Ie@�G�A�I@�Va��!P@�nbN��@Վ���{�@ַ��@���`̜@�$��h�@�geBJϏ@۲/�M�n@������@�^��}� @߿���a#@��;�X@�Ln#@�����@��#R��\@㊈7�W@�R���@��C�@��@kk@���c�	@�݁�O@�"naz@�e-*�1�@�Q:���@�C���Z�        ?d�"�k��?��Z��q?��n5�+?߂z���?���*�&�?��]z�@WfN.�w@O��נ@��*��@!��k	@�Vf��d@!����@%2� {@(�crE0P@,���i@0������@2��L�پ@5}��t��@8)�8!!@;�Jd�@>��C�@@�k�c��@B`o�^MD@D6E(QS�@F(�oF�@H7��i�$@Jcٲ��l@L���eq@Ou��|Z@P�u1�4@R�����@Sz�����@T�#���@VdO���@W�4���@Y��Q�N�@[1X��V�@\裇�:�@^���hŗ@`A�g�Wb@a3���@#@b,��?@c-��$��@d5ŹŌ�@eE{� �d@f\�_T�$@g|��.�@h�L-���@i���8@k
���@lK�yKa@m�t��~@n��]�6@p"�{���@p��V���@q��ڼ[�@rKZ�g>@s�l0�@s����:�@t�OT2Ju@uv�<�I@vN!�+>l@w+lo���        ?S$����?�\����?�h���Oo?�(�)�=?�@ߟ5Ν?�2и�v?�$dq��?�0�TF6@۴8溺@
ݥ�b��@�����@����8@��FP��@����I@!Zx"
@$7��+�@'^�2��@*��fâ�@.�ٵL�@1\r$��@3��d�M�@6
�h�(@8�g8��@;�7�'@@>��KQ�@@�nb��@B�͇�!@D����k@F����!@H��T-�@K�\l��@Mln�:�Z@O�C�%�@QZ#�T�@R�T!���@TS�+b@U��=�@W�����@Y�'�X@[pI�z��@]!<���@_�
T�l@`�om<�@b9��*e�@c�5�@d�t|޿@f_4f�A@g��5/i@i�Dzx@@kNL��&�@m$��'�@o%��"@p�;�߻�@q����k�@rĶ���@s�ʀ@u0!�y�@vy�Fg�@wн���@y4P�,z@z��Q�t%@|!E_~�@}�����O        >����ޘ	?!��+�>.?H8�5�?c�;&��?v���-�?�p���\?��|��Z5?��'Bt��?��`XGN?������V?����o�?��4��?��:;�H>?�3+aS�;?��R,B�_?��b����?�<�E��?睔Տ3�?�<V7ݯ?�%�f��?� {��P�?�ʍ���S@P���	1@Q�|<L@
�nf�j�@(����U@7x�T�3@��k@��Q=!@��&s��@!��t���@$�O�<,@'��m�26@*�p�u�@.��Y�H�@1P0uQ�@3�	wVK�@5��~@8����l�@;vg�a�4@>���ܷ�@A:	�6n@B��@D�,�0@G+a��)@I���[F@L,�"
O�@N��3��@Q �y���@R�_��@T]�뇰�@V9��W>�@X5i�7�p@ZQ�'��_@\��,�W
@^�C�_'@`�DΛ��@bFS*�@cp�j>@d��g�c�@ftRrM�@hׂ���@i���r�        ?�`I�@2�#�^YD@U��+��@m	�@@|�;At@�Љ��_�@��M�'%@��ǱS@��č��@�S�m�p@���1��@�CJʜc�@��|CI�@�4�ǌ@@�����3@���G�@���m@�.���q@��F���@ɑ��^fZ@̒%�@��R�Fg*@ѡ�i�#@�|���}M@�x���(�@ו]q�\Y@�Ӗ��r;@�3[.A��@޴�.�)@����	@�D�_��@぀��	@���y�:@暖RA@�@�� @��bC@[@�4�ۆS@��J4��@�c>t��@����b@����@�Ж��p@��;�;@�����b@�)����3@�W��x�@�����Rc@��"T;�@���� @�b�L�F@��Z���@�}(�l�A D��}&
A �|U��A�k(���A���ߣAO ���A�~��PA�c\n/�A�[����A����Y)A��Lh�cA��1�        ?T(�`�J?�Q#��R�?�H6?�皠�hp?؏����?�h�,f�?��Y���?���N�|?��@��y�@W��(w@� ��1S@�ɍ�@��K�>2@|v��.�@�4M���@�E���@�Bhϛ@ ���WZ�@"�S?uԆ@$���N��@&��+,Y@);h��c�@+��K+�@.!K��oP@0]F�
��@1��M�@3f�Y�@4����@6���
�@7�J�/�@9-����@:� 
�wt@<~pvœ?@>9=T��@@ L8N@@��Sbl@A���l�@B�'wW�C@C�X��@D��J���@E�q�r @F��ly�@HsrX8$@I7g����@Jb��z�@K��U�ĳ@Lͅ���L@N�˜��@OR��
I3@POc�;��@P��~�$@Q���ý@RT�b!!@S|�6<�@S��|���@Tw,��y@U4im�|�@U�z���@V���}�@W�����@XP�( �@Y!�]�?n@Y�Yu�        ?5g]�q�\?dNj~�4Y?��>ӘG?��np���?�EEg�h�?�g�v��?� ��'?��
�y9?����t��?�!$Yy��?і�b���?ՠ�ǰ1�?�A|���i?ߐ]Q)~�?��J%G�?�T��2�o?�\��b>z?� F�~iV?�+�ߪ	 ?�>��`�?��pNo�?��(��@ ����!�@b����@f�uh��@	�Џ}@��B|ݭ@����*@��Tx@H��1�@a���@ֹ�{��@ WK��+�@"x��l}�@$�u�`�@'k�ϓ�@*EϢg41@-e�(�7@0g�����@2Dqet0@4J��O�@6}*(�,s@8އ� �>@;q��1/�@>9	���@@��ڥ�[@B8���H&@C�q�	�G@Eаg��@G�;��F)@I��C�@L:kL]@N��C/P�@P�����@R�C�H�@S��p�T@U����@V�f�D�&@X�B����@Zd�Z[��@\b��!H@^]���@`]� ���        ?@��F��&?{Jò�S?�[,ϖ,?�]4u�[?����a�?��	޾q?�����U|?�i��L�d?�����~?����||?�"HN�%@ ��`�WH@=b���a@+]���@��?NA�@�S�f�V@t��d �@���@�j�$�@��_��@ �V7��@#J딸)T@%�X\�b�@(��3���@,}����@/���(�@1�!����@4;�o��@6��lq��@9O��%@<\h����@?���a�@A�8��&@C�J�@�(@F	��Y@H��ҙa�@K<zW%E@N7�kZ�@P�~��@R����K@Tu�����@V��Ѭ��@Xޅ`��J@[\}�	t@^��k�v@`}�K.ӱ@b��$�h@c�{�O7�@e�䞋�v@g��i,@i�7S�b�@k����@nf�t3x�@p�� 36@q�#���@s_X?o�@t�15�}X@v��Un�@xi2�@�@zM�m.E@|O:/��@~o@4J��@�W�(�֝        ?�8b���@��$ǴR@=��}a��@S{�B��@cVX�\D@p/VU�m+@xL�G�E�@�󺦍z@�v��$f�@���	�+�@�Ą<{qF@��sV�6P@��M�P_@��9�ʜ@�`9�N�@��F�4%�@���2Y�@�b]�@�[��9��@�|ON�J�@�bBxB%@�>H�x�@��9���@��JS�� @��v��;@�®�z+#@���5)xZ@������@���U.@��6Q��@�	){.��@�G�C�@Ő���3@����.�@�=����*@ɣg�ا'@�BO7(@̍�h�}�@��c�C@ϣ���{*@Пޤͯ�@�s�Gݿ:@�M�HZz@�-<l��a@���8Sj@��c���l@����$�@��}�|>@�ޝQT�@���Ӄ@��ߵ|�$@���\��@� wP��@�" H<@�0����@�Q�E��@�;bj2@���M�[@�i�Ϣe�@�C]�V@������@�E}�	t(@��7?F0�        ?p��n��$?���є�q?��e��?��D�^m�?��C��6.@����@
F����l@1��@8P@	ǙĻ�@�旿�.@#
���;@'%�]�@+����F�@0F�tl,@2��8,e�@5Ƅ�E�@8�^x;V@<9�#o�@?�:[+�{@A��fxЩ@C�A�F�@E��!�@GۭPQg=@J+��u�@L�8���@O&iJz|@P�;�u@RK�[�{@S���pV@U>�t�@V�WEi�@Xl�]�T@Z����@[�$��3@]�q0��@_w�(��@`�[:�lC@a��'�?@b�����@c�]���@d�,-��2@e�|&/7�@gq)�vz@hD%׺�3@i{�*u�@j��� �@l��@mV��=�@n��_?)?@p	�}C��@p�j�U�@qxS��S@r5�|;�@r�����M@s���gu?@t�m���@uP��T��@v!@�I(@v�F#C�e@w�N!��@x�w�%pk@y���s&@zjnҋ\        ?Uڢ��g�?��	<�O?�^�>�?�lH�&
?������]?�k���[D?��ED��@�>$�a�@�6cRv@1��;�@�%Os�p@]�t� �@!>ײ��^@$��G�s@(����:@,�Hb���@0��dPFX@3�Cv;:A@6����@9��$�1@=}E�L@@��}�-�@B�╭x�@E\����@H��K`�@J��
b=�@N`��SX@P��WE�@R�}H/��@T��5B�@V�ڇ*P:@Y^���@[��|ɟ�@^�$����@`����R@bu�Wu��@d*���F@e����2}@g�g|N�9@i��q�@l*��w�A@n|����@px�1$4L@qš�Ӑ@s%�j@t��*�i@v��`n�@w�@�{�@yg"b�)D@{*�@�D�@}�ڂ�@~��> �@�z�Ƀ�6@���ΰ=�@����[Q|@��.U��@���d�2@�,=4h�/@�rj�:n@�į���@�#W��@�����L@�E���        ?'�#����?c-��?�P""�?� �����?����o?�+���?�|UcG��?ȭ�F�[u?Х/���3?��0��?��wh�O?�|L�B?�+sdc?�BP��?�X�O�?��s�d>?�����?�	��,W�@w����@��-_Y�@	"�-�+@��L��@�@-� �@�~	�@�_o.��@~��^�@ ��=�?�@#�>��ė@&�8�Z�@*7^L@.�hR�@1 �-�k@3t���K^@6s�h)@8�P�l7s@;����r@?$��qP�@AZ��o�@CG1�D@EXS���@G��Z»@I�����@Lp�*�@O6� ��@P����@Rz�K��x@T�^&@U��:��@W|���@YS�i���@[?����@]B�FwH@_Y���"@`�C��"@a�sY��@c ����@dD+���@e���x9@f˃�5�@h�7\�@ix����K@j��R�jc@lL8��        ?�)M23�K@8�xt��@[��$j�2@r��z �@��v���@�c�V�	@��i��n@�����@�Qm�P�@������@�;Z�oU=@��EiV|@��"~��@�,y���z@�{�9��@�Z�h6@���R�@�V)��@�UBs�b�@����P`@��za�q@���x�J@�7�Q�Y@ؚ$��@�$W�A=@�հzR��@�W	qT@�֟�V��@�imļR�@�;�@��ʀ�D@�پ5�@�p1o�ؘ@�_�Zu�@�a�	�@�:C��d@�L�Ӓ�^@�hrYs`�@�׀�&?@�����@���y[��@�.w<H@�u|�X�j@���`7��@�c�kQ;@�{�M�B@��.K�%�@�R��u�A dڪ�A"��5�2A��[ĥ{A�K�K^�AsE���A?�~>�A6JWA��ci1�A��j�чA�R�z"Ai�Sc��A	HU����A
)�>���A��"A�GE.g        ?3� >��?q\��x1�?����1�F?�B��4�?���"�RJ?�/��	�?�Q�f�?��؝��h?�\��3,T?�I@��?�w
_A�?�~Z8�?�wzdF�?��)�ف�?����P̐@��;�@
�R?j@_��d76@�foT:@
��zBB@@V!~�@�� �B�@E�jK��@���_@�c�p@ +�?Q�5@!��FB@#����f�@%�Yt���@'�+\�\@)�]t���@,%]�`c@.���*g�@0�q�d*@1�Y�Ʊ@3R^���@4��"�k@6a
)Ώ�@8� ��@9�@�S�@;����\k@=kL�a�@?_�4C�@@�`����@A��45��@Bۭ����@C���;��@E,����@Fc�Ͳ3�@G�U��b,@H�Moc41@JJ�U�A�@K�����@M����`@N�p!^�@P�dT2v@P�+'���@Q�S���@Rg�H��@S:j�@TV���(@T�����(@UЏ%F�        ?,"/1��?C/�l{�?i��	�t?���|��?����K�?��ˬW�[?����:��?�W���?�[����?��z& ?���-n�?Қ���:?׊��R?�i�)�1?�-M�sA?�C��dp?�����J?�S'i0?��9�?�S����,?����NB@ M{�s��@ ����@V1��(�@	��g7��@h 	��@J�]g.o@���w@��
@��V�S@m"�@ ey��@"g� �A�@$�#:4�D@&�o��q@){���Eq@,6��(�z@/$}�M�.@1#0{�	�@2�X���@4��� @6}�JF��@8�6;��@:��|��@<��z��@?S�[��@@�N��<�@BG;!V�W@C�7��"@E0�VyH�@F�]���@Hm,����@J,_7�@L�ԋT@M�r3�@O�����R@Q:ⷂ0@R/'Y���@S]݋���@T���[�@U�#9d�@WJ!%�@X����        ?X��Y?��42�?�F�(�%�?��8��Q?�� ��?�d�x�n@S8���@p���@X���@�	N���@$�r��@)�P�[��@/��3��@3}���	�@7aP��r�@;��b�L@@+�B�Z�@B��|�#@E~`�c.@H}���r�@K�bR��/@O.�0�@Qpک��n@Sh8Gf@U}�RϓC@W�T"��n@Z�ǋ�@\v&3�t@_	'���O@`�(���@bK�}���@cˬH�mv@e`�/��@g����@h�/���@j��?N�@l��l@n����hb@p�r�@q�u��o@s] 4�@ttj�@u�|/�#�@w��EW(R@y>��<@{�|o�i@}���^t@@�P�}@��'��q@�2���@�f�Zl��@�د%��@�b`A���@�-�"@��4_��@���3;-@�{�N`E@�}�ߕ��@��h��9@����WA@�O�B1@�<����3@�y��-`         ?�T�j��@�d/U�@4��#��@KI��j	�@Zd�[�ׁ@eDg�ɶ�@n����Ъ@t�e�ڡ�@zzx9�@��o��^@�!KY��@�%Mp��Q@���$��Z@��>�-_@�n&��V>@�bՍ�@������@�&T�0��@��M:��@���[)!@��ɓ���@�W ��X @� ���l@��А�Pz@��KH�7�@���y�bP@�P� }@�$teʝ�@���r�c@�)丱�@�H"6�� @��#�2'�@���W�9@�Ah�J@
�w�@� �ʤ��@�|�i�@���ƾ�@ȯ@���@�f�4He�@�3,�w�,@��v}5�@��8�@��9�Gh@�E�PLT@�7ӿU�@�^*`%@Տ<����@�����;d@�Qh�W�@�b*LF�@ڽo+�p@�#	��\�@ݒ�W�a@���{"�@�HV�y�A@��t�o@�ڒM��r@⪥��2�@�FG�r�@�Xw���@�6K��@�����_        ?�LpΔ��?Ӧ��&T?��v��8'@f�՜b@��_Za@'`�i1�{@1�{�9�@8��{X-@@z�ҕ�@EH����@J۱~�TQ@P��v7�t@Te��w�@X�d�т@]d ���}@aR��L�%@d19:[9@gJ%�|�@j�t�K��@n��L�@p��׎)@r�)A�@t׈rҜ�@v홃��@y���R�@{Q��n@}���
5�@���f��@�5��*�n@�t�݄�@���|C��@��LZ2@�Z����@��k�A[w@�����@�t�E7�@�ܭA�}@�I�Uo�@��n�>�c@�Q͙�S@���>�
@��a��&�@�^W@x�@�&��lM�@���6-]@��>^�T�@���-��@�j���u@�C]�g�@�)��@��IfgQz@��|̐ޘ@��s���@���4�W+@��ʟ�T<@�f�Ŕ��@�L���w@�3X�tq#@�U���S@��@nx@��_�77@�i�pѵ@���vn�        ?���Ln_�?��M4��@v
{ !�@&��+5�(@5X&���@@�5�y�l@HDj�=4@P</����@T�l�9�p@YxjxP�@^}����c@a���3�@d�A���@gQ���n�@j"PK�@l�/B�=*@oߌi��@qc��<R�@r��>W�@tO4݇+@uœ��|�@w;���l@x������@z$�vx�@{�Y��@}f@~wN2�@��/F��@��b}.�@�]���Y@�����@�Ņ�N��@�x�6�R�@�*��0��@���V�@������@�?�]��<@��ją�@��V��&�@�S�q�L@�f/��9@�����1�@�jm^5��@�@��@��c�M��@��G>]9`@�Cx4#z�@������@��y�Ҽ�@���F��@�&�l��@���E2�@����XE�@�j3Z�WJ@��H&ޯ@�W �e�*@��9Em@�X_�S�@��QdɩY@�pK@_@���ue@����N�@�A>�Э        ?�?���?��A6��z@�#��v@��K[1@,%�1$K�@6dS-��@?��Ea@E?��Oh�@K
Ӝ��@P��Ћ"@T�[F�,J@X�x1z@]�6�[�@aˣ�J�@d���h<@hU�[��@k��/��@o��=�[@q��?�Y@t�4��@vGip-�@x�2�7�@z�5�S�)@}*d�1@�?� X @�$�i�@�@4z�M@���ɔa�@��j}d�_@��Y�*�@�q�@@��2�i��@�)q�Zq@���b8ϼ@���:5}�@�b+�UaO@��B�S��@��R�x��@�g�p��@�+���c@������@��� =9�@���	��@�qZ�}c@�R%�[�`@�9[(@�&㿆	E@��7��X@�����@�����S@�	U�� @�'�(ޓ@�:S�ב%@�Sh	�@�9g���p@��M�eg@�by��k@����;@��W$>��@�:�����@����C�(@��d�^�;@�7X1        @E�K�X�@�Z�� ��@��]u��<@�J4<70�@�<aD��O@Ө�?�>T@ܴ���q@�����@�hl+�@���~M|�@󰎒.4�@�����&�@����1��A �sM�bA�!�b�A��**�"A	����AJFȑ�SAi��_uA?�&��A"�*N�AZ�z�Ao?��A�����A"#�ǰA:��`�bA -�A��A!Bx<ƹ�A"Z艞�'A#v�{��A$�	Us��A%�A8*�A&��^��QA(�u�A�A),���YfA*W���@A+�9�P�A,�`L�/�A-�v�4f�A/���pLA0$f��A0���v�A1\�{(n^A1�E:b��A2�Y���	A3<�\�|A3ߓ�s
�A4�K�Z^ A5'���A5��_!A6r!��6TA7�6S�A7�&}V�A8b��B/�A9�U�MA9��0��[A:QЄA:��&�A;��c4�?A<;E�哄A<�+�6�2A=~�xAYA>w�}}        ?� ο	�?�a�Z�?�Fn��~@�I@�@\�xtذ@!��	!��@*LϚ"�&@2�ʩ�@7�\S��@=����@BBZ?e�@E��7� �@I�v"��@ND����h@Ql�A��@Sت�J��@Vg0�T�C@Y�v"�@[��QI@�@^��M���@`���ӳ@b���B�w@d/�SP�y@e�|ҏ`@g��3ԧl@iy�,CS�@kYiE^�@mF��80q@oA����@p���Q|@q���O�@r�t�0�@s�����@t��'�f@v8�]�r@w8�9�f�@xd���K�@y���D��@z�&��N@|W�R�@}C�v
ك@~��0���@��kX@����ѷ@�2f{���@�ھ!
�@����6��@�/���	@�۾w���@����'�@�6驃W@��{)�h@����C@�D����@����K�/@��m��C�@�VT-4fo@��5��l@��.�F��@�k0��տ@��ug�@�Х!��@��9_�0`        ?�ݖ,Ƿ�?ݣջg=�?����c��@���M!�@ �RYRy�@*���ZM@2��\���@9�&�	�@?��Z��@Czz��x�@G@����Y@K.�?,�@O>��	��@Q�| 5@S��u�,@V�t�*�@X;O4>3�@Zz��#/D@\�1x>��@_�n@`�0��U@a�Q�@c�q��:@dT�;$~"@e��
��k@f�AN��z@h"z��f�@ir����@j�2��ɚ@l&7P�S@m�%�,�@n��?{u@p3|��U@p�Rv�{@q����@ru�w0J@s>��ޯ�@t�H�(@t��s[@u����{@v�H�ȵ�@wj6O�4f@xL6u���@y2)Ƹ��@z��V@{	a��@{�f�)90@|��Tw@}��Vh[�@~�'�DRe@��{|G@�q��0.@��s_@�ydP>�@� 5[ĳ@��_�@�D7�zC@��ɶ�&@�1�:�c@�Ě� �W@�Z<��{J@���')ڬ@���j�        ?x�Y�w��?�B',�_?�&wt�1
?�@�L2��?�՛���Q@��5@_/�ү�@�$V�@9u���@ �*N]*@$:ɤ�>@(@tV��@,�̓]�+@0��`�_`@3[�v��@5��b ~o@8o�����@;]-/�$@>u�<%�@@�6r`'2@B��Z�/�@Do��cG�@Fb)v�@Hr� _�[@J�um@��@L��賍�@On߇���@Q�D�e@Ri��~;~@S���^b@Uo(��Y$@W/\��@X�Y���@Z��xF�T@\�<��@^~X�3�@`I2�=t@a^����@b��i_@c�W�8a�@d�n�G�@f(	U��W@gw+�!�@h��^�R�@j8X ա@k��0Og@m'v���@n���
�@p"��I�V@p��["-@q���­�@r��3�b�@s�PT�J�@tm�	K�i@u[a�ߨ�@vN�g�@wH��G�-@xH}�m�@yN�����@z[�w�!�@{osN�@|�+ɞ��@}�&��m        @=-�Ns�\@zѕڥ�6@��ch�&�@���!�I@�ØJ�O�@�G]��S@�D�B�B�@���^PS@�𢐳�@�20u�[@�ks���9@�"�*�@���!-�@��CZΊ@��r��@��rR��@�����v@�� ��A�}���AR�G�JA����ZA�I4���Aۈa��A
�(��Y�Aϰ���Aܣ���Az�0��A���۳A��Ş:�A�`3�@uA�0�8�A	�Py� A4�j#v�Ad>>��A�z��L�Aΰ(Ά�A	��C}wAG�^��A�7��
Aͥ�fQ A �ka��RA!/Hz�BPA!�M5ҧ�A"|\3TF�A#$W��)A#�!i���A$v���5�A% �.|�bA%�3};A&u�����A' �\�A'��zd*A(wC���A)"g/��A)�te3A*xa��߭A+#+>7v�A+�Ω�ԴA,xKs:�xA-"��6�A-��n�A.w�H�nA/!##-        ?����4?Y�?��߃?�Kgt?F?����lp?�ȐY��?����[�?�Ey� �$?ʵ`�rv?�o[.���?�i:=g��?�S3
�g?�b얚�?�f�t�$?�&#�"�?�kM�#�?��r��2�?�<>��^[?�O�╀7@ s��Cg@�ViwS@�y	��@	#ye���@��z{@L��FC@m���O6@����"/@6�y�H�@�僀"�@�����@�� Z�"@!c��n�@#���@$�P�z�@&��#�O@(Z��T�@*B�Ǡ\@,;TS�@.CK0T%p@0-IVS�@1@��>�@2[c���@3~+u*��@4�AE���@5�"�#�@7I���@8a��O�@9��[�@;���u@<q�	���@=�͹B�)@?ZMFw@@o��2�@A6A\@�@B�PZW)@B�T�[9@C�.'���@D� )"-�@Eh�88}@FM�"�B�@G8w��a@H&�kOs@I;w+�@JqT�1/        >��y6G�3?+T�5���?S�g"��?n���B5w?�u%�R�?�d_�$?�B�oJ��?���3�A�?�Qj/�%�?��#1q�?��`�$`r?������;?Ȥ�0�0p?Ϧ�NVUC?�����?�H��J�d?߈�=
��?�ݝ��m?�󓀥/v?�1ag!�?�d.�K?�:L�k,�?�X*sR��?�L$��@��D�@ƺ��n�@5�Fq�:@9�;*�@*��>@���Ut@&i[��@h��W@&鄒�\@�D�=}@!#x5=#�@#%��a@%Q���!�@'�����S@*.U�m��@,�5C�i@/�a�kU@1vkW�>f@3"�r��@4��}�6�@6�wn"��@8������@;�vv�-@=iH��~�@?�p�Ճ@AC����@B�tM��@D&��M@E�����@Gc�&Ua,@I&?���@K����@L��D��@OQNu�@P���^��@Q����]U@R��ؙq-@T2����@U���!�        ?���~sO?[�pJ�L?�L�mi"?�gě��?�eƶ9m�?��s�9�?�#��X?�1GX^w�?�<j߷�K?�,�!g��?�Z�/Bd?��%�^?��l��ܧ?�8��?��[w?�/�Q!
?�i@���?�m�(&8@*� �:@�7�=Yt@�1'��@l�H�d*@<��@�$#�a@T�j�3@��ȳJ<@^� �s@c�Yq%@��8)K�@!�X>�@#��v��@%�"s~�@'�J��@*���޹@,�L�>�P@/Y �ۚ�@1 P���I@2��i�J�@4Y��ψ�@6#>s@8�o��9@:����@<O��r
r@>��TԾ�@@�*��	R@A��R���@Ch��=�@D����@F�-��@Hb%j��@JE���Q@LH�:VC�@NnE�@P[��2��@Q��(j�@Rݢ�(��@T=7�/��@U���t�@W>�� �@X⑀C9@Z�zJ{@\vxO-��@^h�uC��        ?�6�:�?�\ }��@�7Э3@,��Z~H@?K��&ͤ@LLY��H�@V�\�=ԇ@`�*yZ�E@f����@nB��[��@s]���H"@x*�S�@}��X��"@�Ȕ� @� ���"@��o�E��@���Z5�@�Ɯ+�Eb@�O��d@�-S�8@�2+�;��@��Ѓ��e@��z�@�|��)@�>J����@����N��@��P-M��@����i@�4[���f@���s���@���c!(h@�������@�XI'��@����r;-@�g���@�#�=1l@��m1���@�����7�@��5D˳@��W�{�y@����R�@½nJGX@��,��p^@��'%=��@��S&G�@��=օb@����7g@�D�EB@�s�]ַ�@˫e}��q@����7�@�2����@ς�Q�5_@�m���@@�2���@���*^�@ҋѓ�@�H���:@�	�#{@��b-�P�@Ֆ�Yr�@�c�=w�@�2��]�        ?��Z	��?ϣ�jN�X?�A޽*/�@(
�r��@$�D���@!��@&�<�qK@/��M��@4�����@:0�;��@@����@Ci>z�@F�a02�O@J�%�i^�@N�3�W�@Q���T�4@S���x{A@VL�ψ��@X�O:J�I@[q�" w�@^,�z�$@`�q��@a��]�2Z@c�:~ޱ@eje���@f�
��"@hl!�mZ�@j2Hs�C@l_���@m�~�e�h@pm9���@q�b'>�@r38TK�@sa\�l�z@t�z�f��@u����@wF��a/@x�9*5@z,��@{�yS��@}S;)���@~�E��>�@�]���T@�B�؇�<@�.	��@��y��6@�l�q@����hf@���� ?@����Nr@�:t*�!@���i]@��Z�c1@����b�@�)�5�l@�8��"@�Ju<G>�@�^c��`f@�:T~0��@�Ɯ���@�T��@�❋�%m@�rl���V        ?dKA��p?�-*%ː?����5?�z��?�}cP��?�
�?� ��t?�ٕ��:?� ��m�a@�!ߕ�"@��{�@&j�5�@C�A�@(�<��@5_Y;��@d����{@�{u��@ ��hlv>@"O�A���@$ ��1@& m~��@'�j:�@)�i��Q�@,n�t@.O�;��@0R��"@1�=�w�}@2ۧT �@4<�s4�@5��[J�r@7B�sR�@8�#�RS�@:��U)��@<�k� ��@>�ҕ��u@@^0�ȁ�@A�J�#�&@B�V���x@DN���<@Er� ��@F�brR�@H�-��2?@J+e�ǐ@K�{�F_@Mϊ0^�[@O�޹m��@P�=�@R��G�
@S7��@Tr��.R@U���(@W�1��@@X���;�@Z	Kb�@[�Hpi�@]BA�Q�@^��j�P�@`dA��l�@aT�<�&"@bO%�&�@cS����*@db�vx��@e{t�        ?|�ސ�կ?�\�?ոQ���?����V�?����rQ�@�7��<@�|�j@�O�X@�@*8��@#��V��!@(�!�R�@-��t`��@1��PU�S@4�� ^_Z@8%RSJ��@;��Cc�
@?�ˢ�@B /���@D������@G'���°@JO4#/@M sc��@P?��C�@RX�i�"@Tdm�I(@VY��D�@X\�s�@Z�\�D@]F� ��O@_�;�-)@ad�B�f@b��m&�@du�P�|@f�ʐ��@g��(H��@i��J�@k����PS@m��l��~@o�X���P@p��A=`)@r*'?j�@sg�A�@t��if�@v$�|@w�����@yQ��@{�]O[�@}�SNl�@�'o7�@����Q�@���>7{�@������@�J0h)w�@�����o�@�%_%�R@��=�"�@�*�A�v4@�νʧ|@���rq�:@�Iٟ�b@��n����@��i6ͧ@���>(@�        @1#M��C�@j2��['�@������@�h-s�I�@��˹�
@����&�Q@�����@�h��5�@Ϫ!�v�@��uۗH@�/�P�i@��JCA�@��O�]�9@�{&��S@����{�@镁�r��@��3��k@����A@�ՙ;戨@�C���@��1psד@��6�= @��{�`�@�����@��8�l?�A 
�U�AE����A��'9HA�z���yA&V��OA���~tAe!��IA	���ӪrA]��g�A&5�Jc3A�f, AQ��|A���s�#A�/�
��A�酼>�A��o��A��|HIARrs��A�X�&�A��$ �IAB]@k�A���$�A��&_9Aa���q/A cX����A!����A!�	"#5mA"���ә�A#:���uA#�HwC�A$�����sA%l:���A&*c���A&��7�sA'��f�%A(m6BSUA)0�K��A)�K
>}(        ?]w`��Z�?����|?��!��,?��c3(4?�Z�C��?���HG�@��,�@
��y�~@�J@@���w�@"ua]bo@!���@$C�N�'\@'�d[��@+gR�S�@/Q6�N-N@1����a@3��M��@66Ib���@8�����@;&u<��@=�z�˦@@E�x���@A��?�˝@C4�'J�@D��ɖ��@F^����@H
�J���@I���f�s@K�l���t@Mmx��n@OW�:��"@P�c��@Q��ҿ@R��Z%7@S��ګ6	@T߳8Ǩ^@U��;p�@W"�J�<�@XNYc���@Y�����@Z�>N2@[�N�JF^@]?�	F&�@^�qF��@_��N4<A@`�x�#�@aO�Rv��@b8����@b���>|�@cx��DZ�@d8�۫(@d�H���;@e� ��%O@f�I;���@geS�%3�@h<L�V��@i^ ̾�@i������@j�`G�f�@k̜.��@l��� :�@m�d��(H        ?f<j���?�Stٽ�?�YN���?���
��?�$�S�f@��ڤ�@=v��h�@�����@/��(�#@!�����@%���}r�@)��	3�@.�g�n��@1����3�@4a����(@7.���_�@:+@�׶�@=Z���#?@@`6WJS�@B0 m��\@D��;pP@F.mD�>�@Hae��
@J���B��@M:� f@O�=�~Z@Q_c�q�@R�Ҷ%@T���V�@V:�K�!@X��@Z�q(�@\25E�a@^SRub�@`[�����@a�ۯ�@c�#;+~@d��p-H{@f)�ڗ�@g�)P�Y@i�<M�@kۥ
���@n�hƝ@p9N���@q�b?�@r�5~�@tiBW��P@v
}s�q@w��g���@y�[7���@{����	�@}劓�b@����y@�W��S��@���LV@�	-�!מ@�~�F�F�@�#���@����@�R�N�jL@�����@��Im�d@�ת'3�        ?�)^4T?Fc�n�?jL|�o?���7?���u�9?�_�}�hK?�� ���E?�>׳LU�?�C��)�v?�wݼ�?��Q����?��-�#e@?�s��1?���dr�?����?���/]8?����j�?뉙��A�?�}/��?�@�M?�@1#�~?�c����@ CqƖ�@�X�$�@���@��@	"�E�@�=c�,o@�x�]�-@�M��C�@��k�[@��U��@Бv��@l҃���@!�a}˸+@#�I����@&VX<Jo�@) ��b�@+�A��9@/ ��<@1N��z�?@35r6�֥@5FX��@7�%��a@9�D/\�@<�G��
@?]�Y}�H@A2�u5Es@B��2q@D��1FU@FslxN@�@Huk�@�@J�h�l��@L�Y�C�@O[B�<��@P������@Ra��SV�@Sݮg�s�@Uq�U�I@W;���o@X��&�N�@ZɊ��@\Ȕ��@^���rf@        ?����!�O@?�YUuΗ@c�<�v4*@{�����@� y@��)|Ɨ@����k��@��=@��"@�d��6�<@���5x��@��6�ϖ�@��?�MFo@��Kf�~@��q˷|@��ށ/M@�TO<M�H@ε��,~�@�sZ3@@�����J�@��"�I�~@���	�x@��T-a�@����\@�<6<�h=@߂I��F@����QX@�#�K��V@�cH$cH@䬄<Z��@��H�ٙN@�[dS��@����p �@�.3Վ}�@��/��@�!2���@�x9ϲ*@�+�!�@��T|�v@�Q��4@�z�q)	R@�L��,�@� 	Tu@���E��K@�ϒ?4�@����@���s�q�@�h�f�'@�KS�E6@�0�Wt�S@���m�$@���3`@���a�0�@��dH��@��/<�B/@�ט�t�
A l�\ёA ����0�At��=�eA��f��A��E��Aϙ��A��uK�AA����        ?�� ��R?��j �G:?��Y��a@ ��O:��@@3�sI�@4�@"U���Ĺ@)!�OA�e@0r'�q�@4�m���@9�m�W��@>�T���(@B:K�pD@E@�.��@Hz�:@K�� i�@O}�'ɥ@Q���Ť�@S�
\w�@U�LE�$S@W��#Y�@Z ���@\[7�|,�@^�,��ʣ@`�u�;Q�@a�,Q���@c"�P��@ds�_|
>@e�`�E�D@g)��L'�@h�E��@i��4Y@kh��)�@l�hi��@nYE.vߵ@o�a�hS�@p�t%��J@qu)yB��@r>/Ko�k@s
�A
?@s���@t�zoZ�@u����V@vo ��k�@wV��穸@xD�^{�@y9k_/0�@z4�����@{6�!9zV@|?����@}O�]���@~f��~��@�AK-{�@�Ud'��@��̴�	�@���1�+@�#�P8�@����H@�iΰ��@�,�V1�@���U��h@�l�r�_@���[�k        ?�ˮd;�?�$�9ɏ�?�`!�f
?��,\�	x@O��6@�]�n�9@��]m!�@#��r��(@)�ɐ��@0hξ6c�@47�����@8e�����@<�rmʴq@@�c�{@C�IpX�@Fc��1�q@Icl@L�A�3k�@O�[IlQo@Q��O@S�Q�>e�@U���
S@W��H��@Y�Jvj�@[��\א�@^N�E��@`;�?��@at�����@b�	V� /@d���~@e^��( �@f�����4@h/���*
@i�L]���@k.W9l@l�����@nZ�jN@p�k��0@p܈�}�S@q�ץ�g@r��9K@s������@t��S���@u�����@v�� ��E@w�����@x�w�@y�F��f@{
��~�@|?����U@}~&��7@~�Q4��@�G��s@����*g�@�m��s�^@�&έ<��@����"�@�����N@�r��|�@�A�	�0@�0 �/@��b~��@�Ӡ0W:y        ?e�8s̢?���5&�?��=+�:]?׌�R޳?�SǦ?��&��?�tB �@�2���@�pH*Nq@����P�@_�g�@�A�/J�@!/�ɵ�!@$W����q@'�����@+�z��q@/�X����@1�%<�V@45��MDV@6���@98��}@;�&Yu�@>�����@@@㼰�@Bu�~�)�@Dg��[@E�$a�M@G��8IE�@I�s�8@K~�Z_`@M����`@O�p��e'@Q{��S$@R8*R1�L@S{�/�@T�8(@I�@V6��U @W�$���@Y=��>!�@Z�1�V"@\���P9@^j���:;@`)�}�@a+�~�@b:�Lm+@cW�2E?~@d���U�1@e�O�C@gj���
@hh�
�3<@i؞�AU�@k[�>��@l���X�@n���Ry@p0D�C@q��Q��@r�����@s�v�b�@t)��&��@uG6g&@vr-����@w��W�*W@x�k,�	b        @'�0���@c`Z�3@��E�t��@��Bl�A�@��xO'K@�l�˖f�@�FK��*�@�0X/#o@�T��$r@���y}@�!cj�B@���H�@�X�<W�@��BED�@�����@�&=GN
�@�d�ҞS@�1��@�*����g@�6�}-@�Nkb�F�@���X	�w@��O b��@�Q�艠�@��R�%@�Gj]�N�@��l,z��@�\��C��@���V��E@��U<��@�.�Dqg�@�Ց���A ��8}�A��� �At�X�(iAR�����A2��]�A����A�*Qe��A�,�>�A�#�5RA���Ǘ�A	�9f}��A
�E-��pA�i[� �A��3N�NA܃I�y�A�#�NA�X��A� ���A0��q��A�/��#�Ag*�bDlA܋?��A�WS_�KAT��ǺvA ���sA��[e�Ad�,S�)A>0�[A�PքA��pF�	AWe0���        ?4��~H�?q��C�$?�p%c�?���z�?��ˢO?ͫ�>1M?�Mh�"?�i��RǍ?���Q?�r1�E ?��q�*��?��ncTHm?����E�"?�r��0@����m�@Kz=��:@�JC@
��܊�@0���1@A�O A�@s�e@�{���@���}@�m/%@+@�����@0�Yc�@~����@ q�ٔ!�@!����ȼ@"�j�<@$H/*�߫@%��m�A�@'bʝmN@(~Φ��]@)�s]�&5@+���bK@-d�<ZC@.��{6��@03y+$mo@1&pĝ @1�`"�[l@2�!_&~@3Â[�J�@4��j��F@5����&�@6����̺@7���;@8��ی�Y@9�ڬ���@:�r�)��@<�8�]@=8�kd��@>k�a�/�@?���*��@@v�qeZ@A��%"z@A�S�Ks@By�*��@C.,n�x�@C�=�!H�@D����E[@Efy`���@F,��z��        ?��k��?V�5�1�k?����@;�?�e�?�ru?���C��?��NGwn?ŕd/'PU?Ϣ��vAZ?��2���?��	�t��?�w�;�?�e�|�y?������?��(��?�S�X�N?� �S��?�����6@X^/�;@-w?^P@W�>���@
��Z���@��GW�@���B@���@�:L6R�@��,�@F�@�@ �b�w�u@"�'UA-�@%v,��o@'��w�s�@*����t�@.r���(@0�|��@36�}��@5z�5ޑU@8+�8T@;.�����@>�u8��@A!ǁ}�-@C2"���@Ey�t�?�@G�����@J���R�@M� ����@P�`�)�@R^����@T[�^�(@V��t��q@X�4Wp�@[u�[3t@^?��x��@`����K@bG{Y��k@dް%¨@e��	&@h
��c�@jEES�@l�>Ci��@o>�:b�\@q ��5��@r{���$@tM���        ?71�����?p�^\�Z?�ʘ���?�����^�?��[�N��?��"f�T~?�vJ�?ؤ�ss-�?�rNy��|?���n?�F���c?� @�P�~?�&����?��m��?�hh}�}�?��]b�C�@��� w@�Ѻ��@��Y��@
���@z�ЯEA@�,�Cn@�|�,�@ !%2��@��*Ԣ@�G���x@�e�@ ���Z�@"w�e鯩@$��L��!@&�Y�J�@)*Xw�k�@+�ts�� @.������@0�*8&@2ze�{@4?�$��@6'����@83�c�@:fG]�@<����@?H�m�6#@@����L@Bq�H��m@C��~��@E�D�u@Gj��j�:@IMωL��@KQ���.@Mv�J�k@O�{&�@QdJ�-&@Rd�;���@S�=X�@U@*�˿�@Vх��@X|����;@ZB�&dq@\%�Gp�r@^'a����@`$]۔�E@aE�C�@bx�3v        ?�[�:���@+6��@&9i�F@?�4�m(d@P��o��@]8�G��@fu
0�4b@o���ny�@u6��y@z��7�E@��DN}��@�-?�3��@����@�����@�T_.r@�V�ҡ�@����|kT@�6s�D�%@�֎57��@��X�E�@�ya<@�>�f�z�@�ч�V��@�uz>�x�@�*3=�O@��MH x�@��Ob���@���Ij��@��J�}d@����W�@�כ/��@���}'@����k�@�Tp$@�?ɛ�8�@�k�Qg�L@������@�ٌ��$�@�v����@�d�����@���!q*@�Ao4"@�j犵"N@�h�+��a@�o�f��@��eצ�@�����@�]!�8O@�%H䯦�@��?���X@��?���A@ƛ~��R�@�x'Ce�x@�ZU-iE�@�B{��]@�/b� �@�"/��n0@�c��*�@����t�@���İ�@�"�C?E�@���5��@СB%eX        ?T���� ?��,��TB?�M�:0*?���S?�W{r*6?�a���}}?�����%?�Se9@ ix�̾@�?�oB�@	��y��@f�m��@��~�1�@�V�@��n��-@W[����@ �0..�@"�'X�=*@%be�@'l���ZG@)�?�5@,�l�wun@/3����@13���i@2vH�k��@3��$���@5�7}�F@7#�:��@8����@:|�ok�0@<7���c�@=���z��@?�N>	�@@�m@4�+@A���+�@B������@C�mׅd	@D����.�@E�-
wk@F��h԰@G�HP��@H��?��@I���t�@J�ƜT��@L63S�@MG5���@N~���I@O�*KX�@P�w�M+@Q'��o�4@Q��Hf;�@R�����@S0�YG�@S��-�@T����
�@U[��-J@VZhB��@V�fڊ�@W�еX��@Xx�����@YK��&�B@Z#"���@Z��6�R        ?6�1+~��?r˾��	{?����?l�?�
2)?��%KQ�f?�+��v �?о��?ק��{p?���i^�6?���"2��?�T�ֳz?�]���,�?��W��?�+�pb�?���q��@«�(�@��I�@}���"9@S.s�u@���߯@N�1�@�@��@P-��֝@�R1b3@���9@"H�&��
@$ּ���"@'�Sl�6-@*�̿Q)	@.Y𸜀{@1�+�@3@�x�K@5��F�Y�@83���v@;
k;��E@>&^e4к@@ř�K6�@B��@�ZD@D�s�w^J@F�P093�@I'�{�x@K�d�G��@Nmx�"�s@P�.|&@RCsG��@S�<|@UŦ����@W��Z0!@Y�g��@\�xs@^_�b!@@`rkO�+@a��-mvq@c7f1"l1@d����@fX�A�n@h���u@i߾W��@k���kn�@m���+��@p#a"١@q&ǰ��@r]�k���        ?P�����Z?�'ߦZ?#?�oc@+.?�_���SY?��uy�O8?�.p �/{?�Ν�7?�,��>E?�6��
�M@A��F� @w#'�@��f9��@�q�7y@����s@�L���@hX�cc�@!G�{�@$!{����@'Gt���@*��:�V@.�W-3@1WZط@3����3@6�^��e@8�Ŭ� e@;�[If�@>�w�y�c@@��_o!�@B�n�g�@D���Tw�@F�����@H��y%6Q@KIjYq2,@M�Kٻ[`@PFv*@Q�R� �@SJ|�gg�@T�����@V��ؿY�@X��3�Ϸ@Z�Ms5�@\�s�r��@^��Pr��@`�\�kt@a�`z}��@c>�:T�"@d��/He@f��P��@g��m��@i=]X�K@j���a��@l�aL��"@n���+��@pB�,��@qF���V=@rW|��@stz�ÓJ@t�-�H�@u���{�@wR�ʶ@xk��i5�@y�"����@{;e���C        ?�
\i��@(�[�LJq@L��c�{@b�d�ɜ�@r�~��@�_=��3@��%���@�����@�8x��"@�m���@��y �@�^��{YK@�di� �@��2i��w@�#46ϴ�@���>@�����@���hN��@��Nsan@���a�e!@��N�[@�e٠��@������@Ŷ�g<'v@�r��i8t@�;VN��R@�S� �?@����h�@���Z�>]@�h]�z��@�f�X_p4@�i6����@�n~Wm��@�v�? ��@Ձ�׼�^@֏��'�@ס�&7w@ظ��
�q@��3���@�����wp@��R�/@�L�qFQa@ރ�0P�@�� W�o@��B=���@�+O���@��#��)@ℰgE�@�6�~Od�@����[H@䦯[�C@�d:���{@�%� K�C@��),xǃ@�ָ�D@����B�@�UXWF�@�,f�_��@���O�@���qIE@���X�at@��6+�@��L�        ?_<L�Ȳ�?����~J?�̏'SQ�?ӫ
�^~?�bR?"?�j�����?�����@mG��P@D���P@�d���J@����H@���}4I@.���@��� @"����@%L���@(0.F�݊@+:N�t�@.iP��<@0ݍP3g(@2�=)�c@4a�M"�@6:���Ƴ@8#^k�@:���@<����m@>1o-�X@@(6��*@A=��5��@BY��tR�@C{�w.M�@D�p�]=@E��:��Q@G
0beI�@HH�CC@I�w�Ew�@Jڦ��f@L/�*xC	@M�y��@N�0��N@P.��͏@P�;���@Q��E�Z@Ri�X�B5@S06�FW@S�j.��@T�g ���@U��1X�@Vo:|�c�@WGǐ�@X#��t�@YyJ���@Y�b(�}�@Z�1:�b@[��:�)@\�1
i�@]�N�	�C@^x+�AT�@_jɊQ�@`0E��@`��pY�@a)X�Z�@a��'�        ?8GxuN�W?x����xF?�J�*�r?��E�J?¯?݆��?π�ev�?���84XM?��!�/�?��p-)w?����c��?��폍�?���̚��?��@�B��@�5K��@#{jG� @	:��-@���^C@�ã��@��P��@;�k���@<`�՞@ e	�~�6@"�VX;�n@%�<�@)2��p��@,�g���@0���J��@2�y��?@5st���@8Tm�&V�@;�tE&�@?	6r6�@AtJ!��V@C�N�K�@E��lKU,@Hq��̃@K5��߾@N6�:V8k@P�!�#B�@R~�*�E@Te�[E�`@Vr/�+�@X�7˩��@[I@]�T��YA@`*G��w�@a�6)2�@c:IO
�@d�i
;
�@f�yJD@h�xn��X@j�!CJԑ@m>�K��@ow@a��@q<���@r_҃��@s�3֋�@u[�es@v��,�|�@x�D��t�@z�ؑt� @|j7;�F@~k~qY�        ?J]����?����� ?�'p@��?�M^*�?��@��O?�i���)�?��'�w��?��@g��?�Wb8�?�vS�͝�?�ޘJe�?���2R��@ �R���@�t}[��@:��/��@��KY�@jTL�Z�@�<:ǌ@�����@��}*�@�:���9@N�2��@!�Zcǿ@#"�ܡ@%c��u�@'�+yVl@*��gY�@-`�G�Z.@0?bcW_@1��u�@3�)X�@5��`��@7��JY2@:U��i�3@<��඄
@?�%��@A���r @CZo�
_/@EM�[�@GmZm��@I� u�@L7u.^+@N��~� @P��c�ܱ@Ri*��f�@T��GW|@U�,n��F@W��=���@Y����W�@[�� �1@]�K��^@`">7,�u@a_�$S�@b���:r@d#Et"@e|�z���@f��]�=�@h��Y)�@j8��,�)@k��}S�#@m��I�@o��)�Na@p�[��'        ?�K�q�@(W���F�@K;�359@a�Zŏ�E@q��3�0v@}��E��@�6���%@�
�n.�@����_�c@�X�rб@�[�K�@����߻@��7��%�@��7[�y@��MA-�@�T��dD�@��J���@�R�	P�@��'S�J�@��h!#��@��o����@�S�l{�@���wT�@�tO�˝�@��p6,a@��*��@�vg�q@�4�#��@��ݗ��"@�˦���'@�R&Iي�@�C7����@�9�|%��@�5˥g�@�8�Х*@�B&3=�@�S+��^@�k�1២@؋�-�{�@ٳ�2�@��VJ	��@��sU��@�Z9�V��@ޡa��S�@��+����@�%YzA@�Q����s@�MH�@�ҹU	F@�n�N�#8@�(X��ܥ@��ޞ폒@�G����@�``�Q�@�!<��(@����@覕3�P�@�k����@�2E�h@���*�?�@���6Ju�@쐑Y�G�@�]���WI        ?��3��[�?��
8(�?ٺ-�d�?�:?f�+ ?�kaפ�L@	�&E��W@YWi$��@��sU��@!��@{Z�@'��V�i@,���$D@1��#Fk�@52�e�c@8����k@=x��|,@@ǆ��@C)< ���@E�&�1Ԥ@H^�OO��@K0��NP�@N'�F�30@P��n��J@RAVU�}<@S�uAze�@U�kJ�@W�*����@Yy��t�@[uض��G@]��
m��@_���Js@`�3���@by��l@cCLo��#@d{��4P�@e�z��;W@g
�����@h`��:��@i��o-)@k(��r�@l���znm@nځK�Z@o�2��@p��g7��@q_���@r.נs�(@s"�q5@s��a�kT@t�Y�V��@u�\���@v��k7�@wm�,��@x^��h@yU;�< f@zQUe�\@{S"��C@|Z�\>{�@}g���@~z-B�@����	@�W��L�@��/�@�|1�+c�@�+��d)        ?.[�A�(}?ja���`?�-\�ɽ�?�o��CP?����q�8?��P`*W?�(�0�V@?�ߏ�x9F?�]sq0��?��inr�?瑼�;�?�F�޿_?����}�?�x9�5>�?���dk�?��rQn/@v.�@0¬@0�2��@
z���R @v]Gk�@�T��@(���S@��ji��@�z�"�@ݺ:�(�@��< �2@ �_(�Y	@"o�.�:�@$i&Ì�@&�4��=@(��Z�(�@+m��X��@.,�s�K�@0��'�X�@2.�T�@3���@5ȹE��Z@7̛��0+@9�U�K�@<M��U�9@>�v��tM@@�+ݢ�@B1@{�i@C����@Ea���Lr@G#����1@I���s@J�����@M�:R��@OXke]�@P�I���
@R����@Sn+�,�@T�>K��@VK�(�P�@W��=hv�@Yx���@[/��ʹ@\�:K�c@^�����t@`k��Eӈ@atb�6�W        ?��P��=?��e1�y?�����J�?�����@�i�8�@�]�^�@%{�J#:@.��];�@51�f�4f@;�EyO�@A�26��]@FC��Q}@KD� ��P@Pm��1��@S��v(V�@V�t��W@Z��@G�@^��5U�@a���.oS@cԿ4ET@fQ�#0��@h�7/\��@k�`�C`t@n���`��@p�:.�$f@r�dwI��@tGK���/@v˴�"!@w�%yK@y��Zr�@{�,��@}�>�C�e@��Ԫ'@�0�.u}�@�W���H@��iǝh@���-)@��2MN��@�GI��t�@��'c�@��O5�5@�L�җ5-@��L���@�!N�� @����w�3@���P��@�D(,�@��d��9@���d{�8@��ϟzz@�_v�>�@�,��Vܜ@��r�o �@�����T@��<k(��@��{��" @�\��	K@�;�����@�Oz�y@�Շ��@���8�{@�ظ��@@��E^, �        @:���HE@R �(�Qy@sș�b�@�W��6x�@�m���P�@�^>�A�@�����@�����`>@�2�sנ@��iR��@�*ի�D�@���r��@�U�e!�@��zR	@��rF�^�@����O@�<��@�#�N�]@揍7qڳ@�0� O~�@���h�"@�Әn߁D@��+ǓPn@�y��_KE@����;�@��� yP@��J�Y�@�P����@�+�G	��@�3_�x�@��ӂ%�A �/d rA�j$g�A������A��v� A�h���A��T�5AEِl�A}ثN�A	����A���hAR��=-�A���u�A>6�.�A2��P�IA���l�A�&IB�AX�Ak��A?�o �A��z�%A��C�b�Aa��~A+�L?$�A��3�(A�\�wA���\�wAsb:��AL셲�A)ix��-A��m@�A�GIA��T�-A������        ?E)��ϳ?�7s@�?�����BY?���a��?ѬOd�"�?ާ19.�,?瑩H߶M?�TZm2�?�s�4�G?��@"���@!�5��@0��DƊ@
�[O�h@�
n�@wW>
�7@`�ʪ۲@��I��@�+����@���$@!�1CB�@#�b>���@&��<i@(xK�@*��A%_@-��z�@08�>0b @1�@�o@@3F=~̠�@4�Ut�y�@6����<@8n�*�1@:k����5@<o�B��@>�(��S@@b��C@A�	�[�@B��LwY@DT��)@E[�*��w@F�ր-C�@H3�!��@I�$T��@KM	�O�/@L��O�@N�q��� @P8�$Aa3@Q%=4�(@RA���[@S%�L}@T�ݪ/@U.���@VGWK��Z@Wi4��9�@X�?WxJ;@YȆ��?@[I�K�@\M]�X�@]�JH�\/@^��p���@`,ޣ�<�@`����.@a���@b[��O�        ?-	��?w*t�>�?����?�w�(~�?�{v�i�?�4d���?鲙��?�k=V(;?��`���@��cS�@��l9f@g��ؔ�@�ӈf�M@?��R�@rk	_ҵ@!�.�K�@$�қ���@(��EG_�@,�rnA�+@0�����@3�_���@5�̌�2�@8ΎhL@<�a�'@?���zu@A�<�rE�@C��d��E@F	,�׮v@HrA*s�r@K�;'��@MΡ�fDu@Pbٕ�G@Q��?C7�@S��#C�@UsL�j@WZ�>@p�@Y`-[��\@[��f��@]�(�Y@`�2"Ղ@aY����@b��zTp@d�?�/@e��AjM�@g2b�C��@h⼽���@j���[�@l��0�jI@n�){%3@p_��b�&@q��#
@r��Bٯ@s�v�t��@uV��f��@v�XwK@xCF��Sv@y���p��@{��?��f@}Ak�rx@�aH@���� Dt@��-����@�����>�        ?:ǪFc}?w�&W��?�My���?�]첀��?Ŵ��$�?�G�}�?�x<Z8�?�B�,�?��a�OU?�[�Z�B?�А]@ ��i,&�@�gm��C@	�U�J�@剚J^@����@�"�0�@���Y�@#]h�@!��t$I�@$S)x0��@'����@+��x�@0lyʪ��@3�V�r@7)	X�'@;T��)�@?��N�d@B�u�.x	@E0��Ř@H/ P)�@K ��@N�DZ5@P�~^g�@RY,6�@T7ʅ��@U���4@W�8�L�H@Y�_{W�x@[�:t���@]՘�J�@`0kgU�@a"F��_@bN�YG:�@c��O���@d� �\��@f�O���@g|.
	��@h�|�Иr@jh�"o�x@k�$��@m�ѤSt@oH_��0�@p����@qqW�v?2@rf�ZS@sd�y�d�@tl�gn��@u:mA:"@v�أ���@w��o 9y@x��8M�1@z1���        ?�t�vxI@�Uȳ��@;ǵ�)@T��I��@e4.���@r�`�P@|����I�@��.=2�@���ZO�@��4����@��Pzva@��_��G @�ƨ�壆@���D}@�l��Ր�@�7}ngy@�U�=��2@��882�1@�K�"�!P@�ߣU$ �@��9h��@��2�x��@���U��@��Q���W@�A���@�`4�w�@�Sb	�@�'X�%d@�W�}�]@ͤ�}Љ@�W�P�@�K�0B�@ҟ#\>@���xߚ@�s�Ȣ'@�����V@؇��_x�@�*;!��@�ݚĚ3@ݢJ�7&@�x����@ఒcR��@��Qm@ⴶ��$@��ڤ2�W@��w�h+P@���
� @�.=�Yv�@�dr�-��@�B��`@����3z@�@��ր@��,�j@����~P@�;�0�@������C@�Ulb�;@�H{RԘ@�P���9*@�# ��@����Ca@�ׅ
�Ŏ@��3�<��        ?`�0I`?�- Z�~y?����P�?��c���?�������?��y)��?�V��:3�?��ҭ�@����o @
H��@�;���@v���@J��U@캴\�@	� �@!�)"W��@$ g��m�@&lHDCdG@(��1�Ҟ@+�	:xK�@.h����O@0��*��@2-��34@3�`'��@5j2Ƭ@7"ciE�@8�)�hȞ@:ǽѤ,�@<�[9a8l@>�EOj$@@c�]ڵQ@Av��:��@B��ѫ^Z@C��g�B.@D�@1~��@F!��u�<@Gd�zPc_@H�a�v`O@J�� @KgNN��@L�C&�@NB\{�@O�b�*��@P���M�@Qfq|��@R0EF�9I@R��,H�@Sήb\@T���!��@Uy��L;�@VSttC�@W/��]q@XCJL��@X�mHLk�@Y֊e��@Z��m��@[�����@\�Q���@]���Cj�@^~���T�@_v�]s�n@`9�G|@`�StR9Z        ?q�8���?W.��^Z?yǮ-:��?�h�^Uq"?�R��?���t��?��~0��_?����Y�?���#V�?����n�?�Y򓩦�?�"���?��?l�11?��Ƅ�0G?ש��V(�?��b}��?��%�*6�?����=?�{���?�!)	�i*?���5`O�?�����O�?�\��a?�����/?��a�e�@qV6�)"@2KuL@L�,嘚@
��t�w�@�.�A��@���d@��l��@���:�@�zJ�+@�h�`Q@ S�dw��@"[����@$��D�@'�wo2�@)�1p��I@,��3��@/�?�(�@1�r�#q�@3���
�@5�%�S�@7���$J@:b܏�@=�XӲ�@?޸���=@Ax(f���@C��:��@D�)�K�@F͆@Fn�@H��K��@K	��ʘ�@Ma�\A<w@O�@k��T@QHR��J@R�� �@T<*�y<C@U��1>��@W�6���@Yl�P�V        ?bC|�v��?���H��?����rI�?�埔W)�?�����$�?�?c(k��?�=�t&Hu@ dj��@�JИ�~@
P�d�]�@��T)�@0��4=<@��H�O@	ʾ���@�Z��l�@ �}�j�@"��P�3Q@%��@'`�Ǎ��@)�����@,N݀��U@.��3�W@0�%@2X���Q6@3����Ji@5� �r�p@79��r�g@9�?�1J@:��`R�|@<���``�@?�G��@@�F���@A��gsQ�@C�Nǽ�@DP"[)@E�e)�@G!Z}�@H�Bgُ�@JE����@K����#�@M������@O�*��(�@P����U@Q�u9>q@S!�s�SK@T_�l`��@U��Cڡy@W�R^%@X��_~�@ZA����@[�Hr��G@]�[K�@_��O���@`�L����@a����N@b�}��4@dJ6IR@e5�3=�@fj�]�=Q@g�j��kS@h���;�@jP���5@k�3�"        ?��ن��@-ԅ�o�1@Pn��O��@e� )�(K@ud�&i�@��V
t72@�Z`%�1W@�'!�l�@��eZF'U@�����@�E��~�@���k]�@����7�@��{>DB�@���|J$@�:��5��@��ZO=|�@�C�<}@���~�@�+�X�dc@��ف�@�]J퉤@��3�D<@�W��hS#@��V�13@ǆ���q@�1�&9p@���V{Vl@̯��|��@΂�6ھ@�1��.�@�(�-h�c@�&���11@�+��
{@�73��B�@�I���z�@�b�B�g@ׂ�3�=�@ة��G�@��']P�@�l�@�E��W�@݆��*�@����Oe�@��&�H�@�*a��@�cx?KV�@�N���@��n�z��@�v�wկA@�+̳�M�@�����d@����%�@�W��R8@�Zњ��@����	�2@蕻�<�@�Y����@� �<.�@��Л�n@�{mJj�@샪�@0@�T_q�        ?g��_t<?��!x�4�?�1���?��M��F�?�C�%o?�+�}?�3�	]@����'@�Q��@e@����Z�@4�'���@�p��v@ �} OG@"�a�cK�@%Е�@(�ȠA��@,Qܘ(��@/���7@1Ŷ��i�@3�����g@5�i�}F@7�k�@:;BQZ@<Jt5d@>����
T@@��4��@A��ٟ��@C�)l[6@DhL�N?�@E�s@@G6��\ٗ@H���+D?@J:�!m}@K��1��s@Mw�m�%W@O,���gi@Px/O"�@QaR��,t@RQ����@SI�/��@TGt#vB�@UL���g�@VXp���@Wj���@X�9��@Y�� %*@Z�+4I�m@[��Le��@]7U>��l@^y�9ŭ�@_ŀbta@`�Br!(X@a<{xV�u@a�t��@b�1�V�{@cf����@d(�cӧ(@d��$(�u@e���=�@f�����@gaO'�@h;C�$��@i��PL�        ?��B�$?O򃃶�W?t%g� g?�~���iK?�����?��.�K�?�����R,?�E�@ë!?�:�O_?�>)F9��?�'�����?�M��v\�?�+lM2�?���I�?����qE?�
ڔ�?�.?dNd?�2�ԧat?�2�L�?���M*?���톽?���.�`A@�;����@�L��.@��bǰn@Q��vz�@/�v�c&@�ݫ¹@l)FP@���*�g@��j..c@�-�P/@ yF%��@!�-c�'�@$_'�J7@&4�^sm�@(�(���@+ern�@-��Ƥ\@0es;��)@1��5z�i@3�V�C|@5s}3-@7_��`�h@9n?�B@;�q����@=��c&�@@<Lv�O<@A�>H#@B��|c�@D|��d�@F�Cb�@G�8G��@I���׹�@Kq�����@Mp-��^�@O����غ@P�-	��@R�3D@SH	�v�@T����@U�3��a@Wd�О�        ?H�=��e?��L?����3�?�``B �?Ţ\�Sİ?���
�)?ڇB���`?�t�\W�?���e?�j��<��?��B��?��A��!?���KÏ@I@�%2o@_�NJ)u@�=�v�c@�MѲHR@��:ۙ�@1�L��@����Vk@�8�~@�p�;@ۏ���o@ ���}�@"��[��@$�����@'<�i��@)��5w�@,��s��@/�o~�s�@1y�
�
�@3E��Q@59A���[@7U��h�l@9�Y[Ư�@<�ܞ�@>������@@�hJ��@BOp�_U�@C����F@E�з0��@G����d@I��)l�M@K��G�]M@M�34�	�@P��a@Q]�E{@R���}I@T9�;�@U�����@W/�oL)�@X�5�x4@Z���!�@\yBC@�V@^m�<I�h@`=�%�[?@aQ�"�jU@bsZ�u@c�I�o��@d��EC@f)bRP9@g��4�$�@h艠1�        ?��.�dU@'�-ɼ �@I�3h��@`�K���@p���*@z���C��@��eȇ@���eA@�K�b�e5@�L|@�� �-��@�o�W�,@��nj��@�3���Z:@��N�q�@��Vb�@��]��R@�9��H@��/ܹ�@@��}]�)@�l!��0@���� @�\~K��@��`��-r@�4�~�H@ĳ:��"@�>W���J@��%׳��@�z���
�@�-K���@����[)7@νCZ;t@�N5c��@�E����@�E���Tu@�M�al@�]p�oA�@�uWm�J�@֕�i�a@׼�3V�@�듳��@�"� �x@�_��,$1@ܥ]�� @��ޢE@�F�*�&�@�R4�Wdm@���5V�@�
��l@�{a�R5|@�=��H��@�,�Q�@�ѡ��U@�/�@�y���@�U6DY~@�5Y�ϴ@���y`@�}��,@��HVֲ�@���	Uħ@��`��@�ܾ(:
�        ?��Z¶d�?��#nt?�z��B�?�;CH��@�,���@?T��th@��i�}@%?E:X)@,�Nf��b@2��Wf@78����@<gPp�g@A�g�@DO��@Gd�b��@J�(�Ҽ@N�"Fh�@QZ�j�م@Sy�����@U��9f�U@X"[�~@@Z��2��<@]#�֬S�@_۱�#P@aZ+*-o@b�n-� @df��Y�@f	 �׹@g�����@i�j�l�=@kpqZ���@mm��V^@o�K���@p��j~��@q��rj@s3D��s�@tt����@uĩ�c�@w"`
��@x�tO�H@z�_�k@{��W�p?@}#ɘ�,@~Ɛ!	+@�;���@�����`@�9��n@���SK�@�㢑���@��.���E@���7bҼ@���FA@���@�(n��e&@�R�?�@���w,N�@�±���@�	V�`w@�YL�H�@�Y.L9��@�
)��K@��|�2��@�y�        ?G����{R?���N��d?� �-�f-?��9�v?�2��b?���ˢP�?��d�OJ@�0����@	:�V�l�@c���:@����@u� j� @˖�dL�@"X��z\4@%��t�@)!P��x=@,�B���@0�Z�Ѡ�@2�u ��@5S�Єn5@7���7p�@:�ˬ|XE@=�u��U�@@�,��?v@Ba���@DK0�_�f@FYTB��@H��:Z�b@J����@My.0�P�@P4R
��@Q��3���@SH�%@T�uNT�@V�b��B@Xh�(׏@Zg,�Kv@\�FY��j@^�Z���@`��M��@a���K@c!��N`O@d�3�ɿ�@e�]��Z@g��EGߝ@i�,&�$@j���ݟ@l����d@nc� ��@@p&K�|@q%�U8@r.}WH�@sC�>�&@tc.�%/@u�}ʖx@v�z�nW@x�A��@yb�3eQ�@z��KB�@|5��V��@}��>A�@E��%A@�r��[��        ?�I���?�B��U��@�>�y-@+�6�~@;�\z|�@G�qB�@R9/>'@Y:s���+@`���u�@d��U\�/@i�K�<�@n��1)'�@r ���@t�����@w�3��D@z�{�&�<@}��)F�@����=��@�/���-y@���p@����f@�sܤ���@�N�����@�7�<ݨ@�/�/��@�7�֘��@�����"L@������;@��92t#�@��*�@�;	�wz@�x��O�@�����*@�e�V�@�p�����@��Z����@�MN\��?@��g�~@�,��k"�@���9 t@���W<u$@��o�o��@��q�Po@�m�c�G�@�\}�'f�@�R~9�o�@�O�v(Y@�T&/Վ@�_���p@�s ��@����9��@���{h�U@�ِ*a�@�
�?��@�!���Hp@��ءk��@�eb��@�N��p�@��{����@�c�F._@�u�k@��K'��@�}F��|�        @5;���k�@oZ�x#|+@�ְ��@�8����u@�B̿��@����Xsd@�q;�x/N@ؘ,y��@�]�R{�@��o���@��5�6��@�7.�a�@�{�7h�V@�����@��ޝ1��@�1H� �@��!��0An�}�A����A����3�Aڼz�I�A

R���3AM��|�SA���Q�A�&��C<A�pX��gA���Ao��=�iA����iAFԏ���A�b3��UAS�S��wA��A�7?{+4AS�n�rA �O�e�A!zyY�_�A"nh�kV�A#jf���A$m�ƴ�A%x��>�A&���&�A'���<�A(�0 fIuA)��B�yA+#�P#�5A,]S� A-�z����A.�:?J|A0����A0ʬ�i?A1|���A24A�έ}A2��&*A3�����A4x7otx�A5Ci�5�A6TeNG�A6��k��A7������A8�ϮaqfA9IpAmA:d\7%�>        ?ILQ�S(?������?�3��f*�?ʙb{�� ?�/?�j�?�6ȹw-�?����?��L^@ ������@tl_��@
�$���@Nv�>��@}�*(��@��7@�ٶ1HD@��c�$H@!g&=��@#�����&@&��a�@(��3^H@+$��@-醡@��@0iA˳f!@1��<�|@3��X�o�@55
�鏋@6��>�Y�@8�)W͢�@:�,2�_@<� "	
�@>��A 4@@s��fY@A�SR��@B�L!��@C��k�-�@E,,݂��@Ft� �C�@G�6E�ɂ@I&~��r@J���@��@L�%�wy@M�2���x@O	���~@PO��@Q�pSK@Q�@)�@R�G��	�@S�Q |�@T���2�@U�3�]@Vx6ȏ@WtAF�#�@Xyi��"�@Y����V}@Z�˯ھ@[�f+�o�@\���g}�@^:ڶ��@_�����@`l��3L@aR�h�@aӆ��oM@b��AFQ?        ?;�T6M?��]��yo?�}U��?ǡM�l?�vX���?�Z�͐?�5Oq�LI?��8/a�@������@�n?5Gh@�����@�q�"�@H*����@'���^�@M�)�,�@!]�z�"c@#�e�@&=��m�(@(�R"�
@+����1@.���QT1@1k��@2���#Y@4��v!n�@6b&UK�@8�l�w�@:ǦK"d,@= ��\�@?��$�Q@A#]�`�=@B��� `$@D	���N�@E���Z��@GK�w���@I?%�?4@J�ܠ�@L�u"��@Oʱ_�>@P�t�d�@Qն�@2@S~L��@Tp��W)�@Uݓ�,s�@W`��7h�@X�+\\
1@Z����c@\sH��S�@^S���t@`&�Ӗ|�@a0�VX@bH%?�LB@cn���@d��O�X@e�C��8@gE�w�=�@h����@@j9"�+Sx@k��&�S@m���M@oHv��@p��Jq�@q���@r�	�;H        >�!��i�?+��B	��?PHQ�?e��+�?vE�D� �?�vJ+)�?��
�X%�?���j��?�r��zw?��hU�/??��qr��?���nl�?��o���"?�&Y ��?ǡS���h?΅���_�?ӎ���?��K46?�b�(,?�sGhݠ?�k��,��?� Y�,�?�s��֍�?�s&�jw�?�#ޠ��f@ Nt�|��@{�h�l�@'��E�@a4�{t@�� p@�	��ݣ@��2�@�e��@@�t�r� @! �Q9�@#�[C=T@&K�:�&�@)fA���@,�_�T��@0SEd�@2m&lp�C@4��K�]@7IdY���@:i{!��@=#�c]�&@@>�rÁ@BZ�fS@Dt
3߁@F8ZUi@H��9c2�@K��~m�@M�Z�G`@Pj�)6�@R>qu�l@S���i��@U����_2@W� �@Y�H�p�@\��>�@^���u>X@`��o�w7@bD>�~@c�� 4��        ?��[� @�W���p@?u�O��@W�f��@h�X^���@u�"��i@��+*�@�E�3�/@�k�8�N�@�DPU(uI@����?�@�E��ȵ@�x݂Ν�@���*R�x@��w�b�@��x�,*�@�\/�ֳ@����B�@��Ir��@�b�R�X@��:��A:@���Ba@�M�9}��@��$ s]�@�d�^:@�T�_�E@�Ɨ��X
@Ȕ ��߿@�ukKޓ�@�k�-��@�uw+}~S@�J��
��@�e��3w�@ҋ�@��@Ӽ�A�	�@����?6@�AƢޣT@ו���\�@��M�-~@�aU*+'�@��-���@�`Um�+@��6z�<�@�K�Uq@�#���@�q��@@��4 f�@�׬1<H@��<��˯@��~g�C�@��d_��w@��e���@�|�� l@�;֔^�@�}?_B$@�Ы��Vf@�6M&���@��o�@����@�i��F�@�>���:b@�Y1�b�@��E{m         ?X�ނ��?�}+=3?�hv��%?փ����?���㱟?����0?��c'�@XK�}u@σ^��+@��&�8@�G��_@����@!x�1e3�@$�,.1x@(C�� W@,uX�u@0���>5@2B�@4��<�A�@7	z�S�@9��OL}�@<^�$~	�@?><*�_s@A %�mw�@B���X�@DV�(@FqЖB�@Gԝ�w�W@I��1�j@K�%5|��@M�ֱ.w�@O�l�>e@P��*�!k@Rv���@SA�/P�e@Tz8�J�@U��[�V{@Wo�9��@XlSL�O}@YՖ��X�@[KN�Z��@\͂ʵnN@^\/{�8@_�L����@`�iR!�&@a�`���@b��K�[R@co�����@d\�|D�%@eO�0m�7@fH��qtU@gH��}@hM�=�|@iY"��8�@jj���Ć@k�*�@l�*�Z@m��lJ��@n鬤^��@p^��M@p�b{"�@q?ɦ��l@q�|Z��        ?c�L'�z�?��s��?Οw 0��?��|�.�?�M�⽓R@�o%�Z@${[$�@����*F@/�^��R@ �9�Ԥ@#�6I�L@(\��!@,�m�|U�@0���L_@32&�v�S@5ڷ�M>@8�9>yFT@;���ۡ�@>��ƶa�@@��x]T}@B}W	
��@D0+o��@E�Z��
@G��9�q�@I�`�9a@K�7HR@M˕�ݣ!@O�����@Q"��dl�@RVU$MD@S��T�v@T�5aq�@VV�H
@WѩB���@Yc72q�@[��ː@\ʹ	<\p@^�lVp�@`Q��4��@a]i4�@bx�@7�@c����n@d�O���@f1U|*\�@g��ُU?@i	^�Y�e@j���G̻@l3FsL@m����@o�vjs��@p��$�j@q��9V�@rՍqBg�@s�٦z��@u2��@vB\t��@w�����@x̮��@z%�HZ:�@{��q��@} �ZM��@~�o�@��j+B        ?N�ݐ�??��ĭ#��?���~��?�e`wy?ҩ���9G?߱~�'�?�@1լ?�݆�<�?�r'�)l?���ps�@μ�ظ@�I���@	�(N��H@ ݌@VG�$x2@ԉ����@}v]	g0@T p�@[�kT0�@��g�@!��5��@#cfɡ�@%a�M��@'��4��@)ֺ�LO�@,T���v@/����@0����@2�-�oe�@49�U���@6���W@8GH� =@:(.�|��@<s�;��@>�)u���@@�ĸ{`v@B2��H�@C�����H@ET�f�5@G���t�@H��OE@Jգ(j|@L�W�@e8@O�'��@P����h�@Q�p�T�@S2��`��@T��W��@U�ӰQO�@Wn�YP��@X�����s@Z��v4�5@\=)��@]��-I��@_��0�@`�WѼ�4@a���O��@b�����@c�l_*oR@d���%ls@e�8��Q@@g�hb�@h=t���        ?��]n�@9~腹h@_U�=K�@u���LM@��zt@���'C�}@�x�8�8@�\�
?�@���Ƨ�@�G	��)@���|�"@�P�O�@�{�H��*@��3|@ňz~�@ȻL\���@� ��j,�@Ϸ�M�`~@ѿ���@ӻ���wR@���m��A@��838�@�7Uc���@܋n��׏@��G#�&@�|�G@�;!O�@�Tb��@�sO��e@��ŗ��@��T#�@�Զ�)@�w;d&�@�-7?���@��T�ѻ�@����h@�,A��@�
�}f@�m���b@�^ٶ29q@�VQY��@�S�����@�Whb��@�`��#)�@�o���W@���?^M@��^�[�z@���4,@��ɛI�@�j0&?)@�5�H6+jA 3��,��A �A�̱Al�Y�As@�n�A�3�KhjAQ�x�]�A��ukLA���T�AHT�B�A�-�Z
�A����OAMX�=        ?Y^��
�?���x�y?���#"(T?�ʒ��?�&8R���?�����?�	��F�@��"��@	<����@��[T�d@B��@J��N>@ ���h@#?��5�(@&�¢�:@*�B��@.�Di~ @1�Iu;��@4 ��n�m@6��Ә�@9H�P�O�@<+�7\?@?7��T9@A7��vw�@B�~'�@D����d�@F��uN@H��ģ�D@J�{-��@Lң����@OV�K�@P����@Q��A�E+@SIb�vT@T�����	@V ����D@WlAt���@X�2�#z^@Zb\�(�
@[�)6�)@]�S:W@_ 2����@`d��o�@a>��`��@b���gB@cW{�
@c��V�H@d�*�\�@e��m��@f�d���@g�[���@h��h�|�@iک���@j�мm6u@l 1,pb�@m��<��@n:_�՗�@o_�`�@pDp����@p��W�I�@qu�W
Hb@rv�&B@r��ȃ��        ?GDC:yx�?��{o��?�&%v?�"�f�?�@ˤ��r?�:O���@ K�I�^@Ke��ǰ@,V|Ka�@U	t��@���]�@#��)�@(�N��v�@.LSE&�@20%p�J@5z��,@9$�͕�@=��T�@@�8��m@B�޳c@E]Q����@G���KP @J�P�~5@My�
�h=@P:��.<X@Q�pb�<@Shp!�Å@U�	�II@V��D�@X��И��@Zv�V��@\[I�ɾ�@^L^E�@`%R�-{@a*�8�%@b7��X�D@cL�^���@dj�`�̘@e�Uv�>�@fĵ�?��@h�Q�~@iMQ)�@j�k�w�@l��^�@m�W���@o	t�X�@pQN|}J@q'�y ��@r2�Q��@r�6c	�@s��rTa@t��Fb�@v� o7@w&]�"ݩ@xX�N�f@y���V��@z��.�|I@|\+��� @}ٺ����@lo���@����ԗv@�jd:Pb@�V!�s        ?h����?RO��۝_?u��*d�?�16��	�?�}�hx��?�q�ѮQ�?�R��7��?��'*�B�?���C�L?˲�o��?��S� `?֑lN�o?�D��!�?�_�"y�?��Y�,��?��b(6?�4vx�?�nj�xq?���o�?��H�採@���4�@�C���@lhG|;Q@~��� @���HV@��l
@���u|�@ r����q@#R԰v�@&������@*U��!O@.���ݲ@1������@4_�`���@7i�Ք��@:Թ�O�?@>�����%@A{g�@�@C� #&��@F��n�@I����I�@L�4��J[@PQT���@Rb�F�tj@T���Z@W;@���r@Z�4��@],��¢�@`O����%@b5�E�˩@dL)�>C�@f����g�@i񐹰�@k�����a@n�5�^�@q
���R�@r���j�@t��#J@vʸ,��{@y+Q��@{m	</j'@~ ��BNJ@�a�ǒT$        ?�p�*�@,B�@Q�'��5�@h�E*q�r@y��<в@���S@�ƳJ>�\@�9RE@�O�| }�@�����@�2Pg5*/@��� �q@���=<B�@�:7D��@­ >�q@� ��C��@ɗ�Cb�@�q_��@��h۞��@���Xa�@�C�m.��@׳!{�~@�B����@��r`�G@��頩��@�[��?7Y@��//��@��v�$�@�7/�@���#Uc@��N��,@�w5�{"@��8�W�@��Xo�4�@��I�g!�@��E���@� 1��yu@�A�9F;@�j�5��@����8�@�ͨ5�'�@�	v@�MQ@�L4�g,@����vu@��U��p�@�@)�]
@��@���oA ����?A;��?� A�����A�RS�'7Aw6��A;�ΖZiA8��m�A�3���]A��Q(jtAhIu�\1A99��X�A	^��նA	᳭a�A
�4ObJ*A��9:>An��{        ?8r�N�o?u)�^?��J��m7?���ҟ?�ye��?�#�YSS?ғ�[�ak?قx��!?�
8�Y�?�����X?����?�~���@L?����W�?��#�ߩ�?��g��q?���ʭ��?��f�:m@ ����k@t��v�@O.��4@B���_@N�=��@
s��_�@���^1�@)Md��@�<�]u@��p,�@G�f��@���?V�@�=�G�@s.��I@�qռٗ@u�`�$<@	N�tk@��3t@Up���@ ����p@!h`��o�@"O�4k l@#<���@$/X�q��@%&�� ݱ@&#V����@'$w���@()��֙L@)3�����@*A2�(�@+Re��@,gǲ��@-~����(@.��iu��@/���(i�@0lI#9�@0��W�F�@1�����@2%4�f@2��] �@3RQU*z�@3�f�}@4�޲��s@5$�1<�@5�Zߏ�@6i4	�E        >�?&FH��?+S����?Tu!��/}?p�#l�D??��c%���?��Ռ$�?�����?���z�?��[�H�J?�y`�[{?�\Ov3��?��Zo%ߔ?б�sN�?�f{���?ܻ�lG�}?�dN-t�?�٣��q?�࿫�f�?����	?�)���?�ql�_h@N�.\W~@��WK�@��$߽�@�� ��@u~��B@j0����@�N��s@['Ӻ	h@_�}�� @!�dL�@$J�
�T@&����@)�:r�y@,�� ��@075�@1Ǉ'*6@3��\�@5�SjW�@7��+�Y>@:AfZX�@<s��r@>��_#��@@ר���@BCNjt1�@C�	�;�@EW�^���@Gx3�;�@H���o2<@J��w$?@L�l�/iU@N��N�6�@PW�dp�@Qu��|��@R��v��@S�R���@U"^ul1@Vx�p��@W�(`�*g@YS���$@Z��C"�@\ljZ�Y@^h��        ?!?2�v��?Z�1����?~��Œ�?��M�u�?�� m��A?�+���|H?�����s?�u���R?�T6���p?����O7?�j!>+�L?�
�X6��?�|��,��?��΢�?�/��I?�
�p1 �?��7(9�@?�J��2�@ m��?�Z@ ��Y[�@(��F^�@	��[:�@\st@����@,���'@��j��	@���x;7@
�p�w@��>�r�@!��	t@$'�AE@&���@)}6�D�Z@,��M�?�@0
���|@1��+=��@4�z�o@6{��ۇ�@9��.�@<���^@?B�x6@AiA���@C_�(5�@E���_g3@G��F�@J|�C�jo@MPyJ �@P2}.��@Q��i��@S���r�@U��h �@WŤLm
"@Z'��S8@\�9av��@_*\|��@`�b�@b�r�c� @d#��^�@e��I���@g��^�l@i���p�@k�_T9ٗ@m��l��L        ?��?�p?�3�u�b@!u��"��@6���@Ft>��D@Ro�/��!@[`#�Ok@bv�9��@g�i�x�@m��e�'�@r�n���@uk���@x�&=���@|�Qǳ%:@�J�(��2@�S�I'�@�s��	�@�� 6y�@���ڿ�|@�`��1c@���d^��@�A�p���@��#4��@�
ǚz�y@��Xt��@���^��@�����&�@�E����3@���w��U@��9�k��@���EnU@�8K����@�2��/9x@�5����@�Bf�*P�@�XhM�bW@�wˠԎ@��y-��-@��Q�>��@�/l���@�P�p"e�@��A�?R@�� M�6�@�N���
�@�����^�@���C���@�I�3SR"@�����h@��4�Y@���&��@�Q�%*�E@�G��7�@������@���V��@����K@�]g&R�@�4���a@�+.*��@���0�=@���_�@��� �9�@��>1��@���t8�